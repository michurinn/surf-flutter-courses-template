part of 'receipt_bloc.dart';

@freezed
class ReceiptState with _$ReceiptState {
  const ReceiptState._();
  List<CategoryWithProductsModel>? get productEntityList => when(
        loading: () => null,
        loaded: (productEntityList) => productEntityList,
        sorted: (productEntityList) => productEntityList,
        empty: () => null,
        sortedByCategory: (productEntityList) => productEntityList,
      );

  // Состояние загрузки данных
  const factory ReceiptState.loading() = _Loading;
  // Состояние отсутствия данных
  const factory ReceiptState.empty() = _Empty;
  // Состояние успешной загрузки данных
  const factory ReceiptState.loaded(
      {required List<CategoryWithProductsModel> productEntityList}) = _Loaded;
  // Состояние успешной сортировки данных
  const factory ReceiptState.sorted(
      {required List<CategoryWithProductsModel> productEntityList}) = _Sorted;
  // Состояние успешной сортировки данных по Типу
  const factory ReceiptState.sortedByCategory(
      {required List<CategoryWithProductsModel> productEntityList}) = _SortedByCategory;
}
