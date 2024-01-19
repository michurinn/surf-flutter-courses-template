import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/extensions/string_hardcoded_extension.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/widget/pet_form_field.dart';

// Виджет для отображения полей с прививками питомца
class PetvaccinationsWidget extends StatefulWidget {
  const PetvaccinationsWidget({super.key});
  @override
  State<PetvaccinationsWidget> createState() => _PetvaccinationsWidgetState();
}

class _PetvaccinationsWidgetState extends State<PetvaccinationsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Сделаны прививки от:',
          style: TextStyle(color: Color(0xFF414657), fontSize: 24),
        ),
        _PetVaccinationsCheckedTile(
          label: 'Бешенства'.hardcoded,
        ),
        _PetVaccinationsCheckedTile(
          label: 'Ковида'.hardcoded,
        ),
        _PetVaccinationsCheckedTile(
          label: 'Малярии'.hardcoded,
        ),
      ],
    );
  }
}

class _PetVaccinationsCheckedTile extends StatefulWidget {
  const _PetVaccinationsCheckedTile({required this.label});
  final String label;
  @override
  State<_PetVaccinationsCheckedTile> createState() =>
      __PetVaccinationsCheckedTileState();
}

class __PetVaccinationsCheckedTileState
    extends State<_PetVaccinationsCheckedTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            isChecked = !isChecked;
          }),
          child: Row(
            children: [
              Checkbox.adaptive(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  fillColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFFFF8087);
                    }
                    return Colors.white;
                  }),
                  value: isChecked,
                  onChanged: (bool? v) {
                    if (v != null) isChecked = v;
                  }),
              Expanded(
                child: ListTile(
                  title: Text(
                    widget.label,
                    style:
                        const TextStyle(color: Color(0xFF414657), fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isChecked)
          PetFormField(
            label: 'Дата последней прививки',
            withDatePicker: true,
            validator: (string) {
              return (string == null || string == '')
                  ? 'Укажите дату дд/мм/гггг'
                  : null;
            },
          ),
      ],
    );
  }
}
