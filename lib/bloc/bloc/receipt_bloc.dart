// ignore_for_file: library_private_types_in_public_api

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_courses_template/data/domain/category_with_products_model.dart';
import 'package:surf_flutter_courses_template/data/domain/product_in_cart.dart';
import 'package:surf_flutter_courses_template/data/repository/product_entity_repository.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';
part 'receipt_bloc.freezed.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  final IProductEntityRepository productEntityRepository;
  ReceiptBloc({required this.productEntityRepository})
      : super(const _Loading()) {
    on<ReceiptEvent>((event, emitter) {
      return event.map<Future<void>>(
        load: (event) => loadProductEnteties(event, emitter),
        sort: (event) => sortProductEnteties(event, emitter),
      );
    });
  }
  // Загрузка начального списка
  Future<void> loadProductEnteties(
      _Load event, Emitter<ReceiptState> emitter) async {
    final response =
        await productEntityRepository.getProducts(receiptId: event.receiptId);
    final products = response.map(ProductInCart.fromProductEntity).toList();
    final categories = products.map((e) => e.category).toSet().toList();
    final result = categories
        .expand(
          (element) => [
            CategoryWithProductsModel(
                name: element,
                products: products
                    .where((product) => product.category == element)
                    .toList())
          ],
        )
        .toList();
    emitter(ReceiptState.loaded(productEntityList: result));
  }

  // Сортировка загруженного списка
  Future<void> sortProductEnteties(
      _Sort event, Emitter<ReceiptState> emitter) async {
    final result =
        List<CategoryWithProductsModel>.of(state.productEntityList ?? []);
    if (result.isNotEmpty) {
      final products = event.sortedList;

      final categories = products.map((e) => e.category).toSet().toList();
      final sorted = categories
          .expand(
            (element) => [
              CategoryWithProductsModel(
                  name: element,
                  products: products
                      .where((product) => product.category == element)
                      .toList())
            ],
          )
          .toList();
      emitter(ReceiptState.sorted(productEntityList: sorted));
    }
  }
}
