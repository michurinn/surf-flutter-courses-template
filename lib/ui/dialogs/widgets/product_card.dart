import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_typography.dart';
import 'package:surf_flutter_courses_template/data/domain/amount.dart';
import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.entity, super.key});
  final ProductEntity entity;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
        SizedBox.square(
          dimension: 70,
          child: Image.network(
            entity.imageUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  entity.title,
                  style: AppTypography.textNormal,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entity.amount is Grams? '${entity.amount.value} гр' : '${entity.amount.value} шт',
                      style: AppTypography.textNormal,
                    ),
                    Text(
                      entity.price.toString(),
                      style: AppTypography.textBold,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
