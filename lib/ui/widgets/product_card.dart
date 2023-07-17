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
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            width: 70,
            height: 70,
            child: Image.network(
              entity.imageUrl,
              fit: BoxFit.cover,
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
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    entity.title,
                    style: AppTypography.textNormal,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entity.amount is Grams
                            ? '${entity.amount.value / 1000} кг'
                            : '${entity.amount.value} шт',
                        style: AppTypography.textNormal,
                      ),
                      _EntityPriceWidget(
                        entity: entity,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class _EntityPriceWidget extends StatelessWidget {
  const _EntityPriceWidget({required this.entity});
  final ProductEntity entity;
  @override
  Widget build(BuildContext context) {
    switch (entity.sale) {
      case 0.0:
        return Text(
          '${entity.price/100} руб',
          style: AppTypography.textBold,
        );
      default:
        return Row(
          children: [
            Text(
              '${entity.price/100} руб',
              style: AppTypography.textLined,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              '${(entity.price - entity.sale)/100} руб',
              style: AppTypography.textRed,
            ),
          ],
        );
    }
  }
}
