import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';
import 'package:surf_flutter_courses_template/data/domain/typedefs.dart';
import 'package:surf_flutter_courses_template/data/repository/product_entity_repository.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';
part 'receipt_bloc.freezed.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  late final IProductEntityRepository _productEntityRepository;
  ReceiptBloc({required IProductEntityRepository productEntityRepository})
      : super(const _Loading()) {
    _productEntityRepository = productEntityRepository;
    on<ReceiptEvent>((event, emitter) {
      return event.map<Future<void>>(
        load: (event) => loadProductEnteties(event, emitter),
        sort: (event) => sortProductEnteties(event, emitter),
      );
    });
  }

  Future<void> loadProductEnteties(
      _Load event, Emitter<ReceiptState> emitter) async {
    final response =
        await _productEntityRepository.getProducts(receiptId: event.receiptId);
    emitter(ReceiptState.loaded(productEntityList: response));
    return Future.value(1);
  }

  Future<void> sortProductEnteties(
      _Sort event, Emitter<ReceiptState> emitter) async {
    final List<ProductEntity> result = List.of(state.productEntityList ?? []);
    if (result.isNotEmpty) {
      result.sort(event.sortingFunction);
      emitter(ReceiptState.sorted(productEntityList: result));
    }
    return Future.value(1);
  }
}
