import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/bloc/bloc/receipt_bloc.dart';
import 'package:surf_flutter_courses_template/data/repository/product_entity_repository.dart';
import 'package:surf_flutter_courses_template/data/repository/product_entity_repository_current.dart';
import 'package:surf_flutter_courses_template/ui/receipt_screen.dart';

void main() {
  runApp(RepositoryProvider<IProductEntityRepository>(
    create: (context) => ProductEntityRepository(),
    child: BlocProvider<ReceiptBloc>(
      create: (context) => ReceiptBloc(
          productEntityRepository: context.read<IProductEntityRepository>())
        ..add(const ReceiptEvent.load(receiptId: '')),
      child: const MaterialApp(
        home: ReceiptScreen(
            receiptId: 'Чек № 56', receiptDate: '24.02.23 в 12:23'),
      ),
    ),
  ));
}
