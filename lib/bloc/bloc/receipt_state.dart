part of 'receipt_bloc.dart';

@freezed
class ReceiptState with _$ReceiptState {
  const ReceiptState._();
  List<ProductEntity>? get productEntityList => when(
        loading: () => null,
        loaded: (favoritePlaces) => favoritePlaces,
        sorted: (favoritePlaces) => favoritePlaces,
        empty: () => null,
        sortedByCategory: (favoritePlaces) => favoritePlaces,
      );

  // Состояние загрузки данных
  const factory ReceiptState.loading() = _Loading;
  // Состояние отсутствия данных
  const factory ReceiptState.empty() = _Empty;
  // Состояние успешной загрузки данных
  const factory ReceiptState.loaded(
      {required List<ProductEntity> productEntityList}) = _Loaded;
  // Состояние успешной сортировки данных
  const factory ReceiptState.sorted(
      {required List<ProductEntity> productEntityList}) = _Sorted;
  // Состояние успешной сортировки данных по Типу
  const factory ReceiptState.sortedByCategory(
      {required List<ProductEntity> productEntityList}) = _SortedByCategory;
}
