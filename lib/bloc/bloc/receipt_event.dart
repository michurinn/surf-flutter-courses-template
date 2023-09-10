part of 'receipt_bloc.dart';

@freezed
class ReceiptEvent with _$ReceiptEvent {
  // Загрузка начального списка
  const factory ReceiptEvent.load({required String receiptId}) = _Load;
  // Сортировка загруженного списка
  const factory ReceiptEvent.sort({required List<ProductInCart> sortedList}) =
      _Sort;
}
