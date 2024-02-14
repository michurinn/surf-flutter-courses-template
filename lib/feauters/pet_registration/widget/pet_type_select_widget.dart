import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/extensions/string_validate_email_extension.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/domain/pet_type.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/widget/pet_widget.dart';

// Виджет для отображения Row с возможными типами питомцев
class PetTypeSelectWidget extends StatefulWidget {
  const PetTypeSelectWidget({super.key, required this.onChanged});
  final void Function(PetType pet) onChanged;

  @override
  State<PetTypeSelectWidget> createState() => _PetTypeSelectWidgetState();
}

class _PetTypeSelectWidgetState extends State<PetTypeSelectWidget> {
  PetType? checkedPet;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      PetWidget(
        iconPath: 'assets/pet_icons/icons8-хомяк.svg',
        petName: 'Хомяк'.hardcoded,
        isChecked: checkedPet == PetType.rat,
        onChanged: () {
          widget.onChanged(PetType.rat);
          setState(() {
            checkedPet = PetType.rat;
          });
        },
      ),
      PetWidget(
        iconPath: 'assets/pet_icons/icons8-parrot.svg',
        petName: 'Попугай'.hardcoded,
        isChecked: checkedPet == PetType.parrot,
        onChanged: () {
          widget.onChanged(PetType.parrot);
          setState(() {
            checkedPet = PetType.parrot;
          });
        },
      ),
      PetWidget(
        iconPath: 'assets/pet_icons/icons8-pet-commands-train.svg',
        petName: 'Кошка'.hardcoded,
        isChecked: checkedPet == PetType.cat,
        onChanged: () {
          widget.onChanged(PetType.cat);
          setState(() {
            checkedPet = PetType.cat;
          });
        },
      ),
      PetWidget(
        iconPath: 'assets/pet_icons/icons8-shiba-inu.svg',
        petName: 'Собака'.hardcoded,
        isChecked: checkedPet == PetType.dog,
        onChanged: () {
          widget.onChanged(PetType.dog);
          setState(() {
            checkedPet = PetType.dog;
          });
        },
      ),
    ]);
  }
}
