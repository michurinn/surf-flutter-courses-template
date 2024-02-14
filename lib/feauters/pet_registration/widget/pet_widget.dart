import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Квадратик с иконкой и названием птиомца
class PetWidget extends StatelessWidget {
  const PetWidget(
      {super.key,
      required this.onChanged,
      required this.iconPath,
      required this.isChecked,
      required this.petName});
  final VoidCallback onChanged;
  final String iconPath;
  final bool isChecked;
  final String petName;
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isChecked ? const Color(0xFFFF8087) : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                iconPath,
                // ignore: deprecated_member_use
                color: isChecked ? Colors.white : const Color(0xFF414657),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              petName,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
