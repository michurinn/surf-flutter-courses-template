import 'package:surf_flutter_courses_template/data/domain/amount.dart';
import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';

// Класс, представляющий покупку.
// Содержит рассчитанную стоимость на основании количества, цены и скидки
class ProductInCart extends ProductEntity {
  final num purchaseAmount;
  final num oldPurchaseAmount;
  ProductInCart(
      {required super.title,
      required super.price,
      required super.category,
      required super.imageUrl,
      required super.amount,
      required this.purchaseAmount,
      required this.oldPurchaseAmount,
      super.sale});

  factory ProductInCart.fromProductEntity(ProductEntity productEntity) {
    late final num quantity;
    if (productEntity.amount is Grams) {
      quantity = productEntity.amount.value / 1000;
    } else if (productEntity.amount is Quantity) {
      quantity = productEntity.amount.value;
    } else {
      throw Exception(
          'Unknown amount is ProductInCart, ${productEntity.amount.runtimeType}');
    }
    final purchaseAmount =
        (productEntity.price - productEntity.sale) * quantity;
    final oldPurchaseAmount = productEntity.price * quantity;
    final sale = productEntity.sale * quantity;
    return ProductInCart(
        amount: productEntity.amount,
        category: productEntity.category,
        imageUrl: productEntity.imageUrl,
        price: productEntity.price,
        title: productEntity.title,
        sale: sale,
        purchaseAmount: purchaseAmount,
        oldPurchaseAmount: oldPurchaseAmount);
  }
}
