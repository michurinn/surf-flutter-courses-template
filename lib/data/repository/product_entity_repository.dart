import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';

/// Репозиторий доступных продуктов
abstract class IProductEntityRepository 
{
  /// Получить список доступных продуктов
  List<ProductEntity> getProducts();
}