import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';
import 'package:surf_flutter_courses_template/data/domain/typedefs.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';
part 'receipt_bloc.freezed.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  ReceiptBloc() : super(const _Loading()) {
    on<ReceiptEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
