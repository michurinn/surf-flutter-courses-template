import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_typography.dart';
import 'package:surf_flutter_courses_template/ui/widgets/product_card.dart';

class ProductCategoryWidget extends StatelessWidget {
  const ProductCategoryWidget(
      {required this.category, required this.cards, super.key});
  final List<ProductCard> cards;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: AppTypography.title2,
        ),
        ...cards
      ],
    );
  }
}
