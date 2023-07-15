part of 'receipt_bloc.dart';

@freezed
class ReceiptEvent with _$ReceiptEvent {
  const factory ReceiptEvent.load({required String receiptId}) = _Load;
  const factory ReceiptEvent.sort({required  SortingFunction sortingFunction }) = _Sort;
}
