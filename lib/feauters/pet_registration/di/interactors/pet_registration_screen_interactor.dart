import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/di/states/pet_registration_screen_states.dart';
// Интерактор готовности формы к отправке
class PetRegistrationScreenInteractor {
  final ValueNotifier<PetRegistrationScreenState> _petRegistrationScreenState =
      ValueNotifier(NoData());

  ValueNotifier<PetRegistrationScreenState> get currentStateValueNotifier =>
      _petRegistrationScreenState;

}
