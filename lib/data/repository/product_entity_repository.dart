import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';

/// Репозиторий доступных продуктов
// ignore: one_member_abstracts
abstract interface class IProductEntityRepository 
{
  /// Получить список доступных продуктов
  Future<List<ProductEntity>> getProducts({required String receiptId});
}
