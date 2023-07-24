import 'package:surf_flutter_courses_template/data/domain/category.dart';
import 'package:surf_flutter_courses_template/data/domain/product_in_cart.dart';

// Модель категории товара со списком товаров данной категории для отображения на UI
class CategoryWithProductsModel {
  final List<ProductInCart> products;
  final Category name;
  CategoryWithProductsModel({required this.name, required this.products});
}
