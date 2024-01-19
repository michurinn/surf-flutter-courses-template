import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/extensions/string_hardcoded_extension.dart';
import 'package:surf_flutter_courses_template/extensions/string_trim_whitespaces_extension.dart';
import 'package:surf_flutter_courses_template/extensions/string_validate_email_extension.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/di/interactors/pet_registration_screen_interactor.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/di/states/pet_registration_screen_states.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/domain/pet_type.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/widget/pet_form_field.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/widget/pet_type_select_widget.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/widget/pet_vaccinations_widget.dart';

// Экран регистрации питомца
class PetRegistrationSrceen extends StatefulWidget {
  const PetRegistrationSrceen({super.key});

  @override
  State<PetRegistrationSrceen> createState() => _PetRegistrationSrceenState();
}

class _PetRegistrationSrceenState extends State<PetRegistrationSrceen> {
  // Показывать ли область с прививками
  final ValueNotifier<bool> _showVaccines = ValueNotifier(true);
  // Используется для прослушивания результатов валидации и установления стейта готовность нажать кнопку
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  // Dirty hack: чтобы понять, что какой-то зверёк был выбран
  bool petIsChanged = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(175, 178, 188, 1),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                PetTypeSelectWidget(onChanged: (pet) {
                  // Когда выбран какой-либо зверёк
                  // Dirty hack: чтобы понять, что какой-то зверёк был выбран
                  petIsChanged = true;
                  switch (pet) {
                    case PetType.rat:
                      _showVaccines.value = false;
                      break;
                    default:
                      _showVaccines.value = true;
                      break;
                  }
                }),
                Form(
                  key: _keyForm,
                  onChanged: () {
                    // Установка стейта в зависимости от результатов валидаций
                    if (_keyForm.currentState != null &&
                        _keyForm.currentState!.validate()) {
                      if (petIsChanged) {
                        context
                            .read<PetRegistrationScreenInteractor>()
                            .currentStateValueNotifier
                            .value = ReadyState();
                      }
                    } else {
                      context
                          .read<PetRegistrationScreenInteractor>()
                          .currentStateValueNotifier
                          .value = ErrorState();
                    }
                  },
                  child: Column(
                    children: [
                      ...[
                        PetFormField(
                          label: 'Имя питомца',
                          validator: (string) =>
                              (string != null && string.trimmed.length < 3)
                                  ? 'Укажите имя питомца от 3 до 20 символов'
                                  : null,
                        ),
                        PetFormField(
                          label: 'День рождения питомца',
                          withDatePicker: true,
                          validator: (string) {
                            return (string == null || string.trimmed == '')
                                ? 'Укажите дату дд/мм/гггг'
                                : null;
                          },
                        ),
                        PetFormField(
                          label: 'Вес, кг',
                          validator: (string) {
                            return (string == null ||
                                    string == '' ||
                                    string.replaceAll('0', '') != '')
                                ? null
                                : 'Укажите вес, больше 0 кг';
                          },
                          formatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp('[0-9]'),
                            ),
                            LengthLimitingTextInputFormatter(3)
                          ],
                          keyboardType: TextInputType.number,
                        ),
                        PetFormField(
                          label: 'Почта хозяина',
                          validator: (string) =>
                              (string == null || !string.trimmed.isValidEmail)
                                  ? 'Укажите email в формате ya@molodec.com'
                                  : null,
                        )
                      ].map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: e,
                        ),
                      ),
                      // Область с вакцинами
                      ValueListenableBuilder(
                        valueListenable: _showVaccines,
                        builder: (context, value, child) {
                          return value
                              ? const PetvaccinationsWidget()
                              : const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Кнопка Отправить
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: context
              .read<PetRegistrationScreenInteractor>()
              .currentStateValueNotifier,
          builder: (context, value, child) {
            final isReady = switch (value) {
              NoData() || LoadingState() || ErrorState() => false,
              ReadyState() => true,
            };
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    isReady ? const Color(0xFFFF8087) : const Color(0xFF414657),
                  ),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  if (!petIsChanged) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Выберите зверя'.hardcoded),
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Отправить'.hardcoded),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
