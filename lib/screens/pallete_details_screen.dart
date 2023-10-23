import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/color.dart';

class PalleteDetailsScreen extends StatelessWidget {
  const PalleteDetailsScreen({super.key, required this.colorElement});
  final ColorClass colorElement;
  final double kHorizontalPadding = 20;
  final double kVerticalPadding = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Hero(
              tag: colorElement.name,
              child: Container(
                color: colorElement.hexColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: kHorizontalPadding, top: kVerticalPadding),
            child: Text(
              colorElement.name,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kVerticalPadding, horizontal: kHorizontalPadding),
            child: FieldWithShadow(text: ['Hex', colorElement.value]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kVerticalPadding, horizontal: kHorizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FieldWithShadow(text: ['Red', colorElement.redPart]),
                FieldWithShadow(text: ['Green', colorElement.greenPart]),
                FieldWithShadow(text: ['Blue', colorElement.bluePart]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FieldWithShadow extends StatelessWidget {
  const FieldWithShadow({super.key, required this.text});
  final List<String> text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: text
            .map((element) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(element),
                ))
            .toList(),
      ),
    );
  }
}
