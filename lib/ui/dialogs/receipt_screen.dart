// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/bloc/bloc/receipt_bloc.dart';
import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';
import 'package:surf_flutter_courses_template/ui/dialogs/sorting_receipt_dialog.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen(
      {super.key, required this.receiptId, required this.receiptDate});
  final String receiptId;
  final String receiptDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => print('Back arrow pressed'),
        ),
        centerTitle: true,
        title: Row(
          children: [
            Text(receiptId),
            Text(receiptDate),
          ],
        ),
      ),
      body: BlocBuilder<ReceiptBloc, ReceiptState>(
        builder: (context, state) {
          return state.when(
              loading: () => SizedBox(
                    child: CircularProgressIndicator.adaptive(),
                  ),
              empty: () => Text("Nothing here yet"),
              loaded: (productEntityList) => _ReceiptScrollableList(
                  productEntitiesList: productEntityList),
              sorted: (productEntityList) => _ReceiptScrollableList(
                  productEntitiesList: productEntityList),
              sortedByCategory: (productEntityList) => _ReceiptScrollableList(
                  productEntitiesList: productEntityList));
        },
      ),
    );
  }
}

// Список товаров в чеке, с заголовком и кнопкой сортировки и Суммами в конце списка
class _ReceiptScrollableList extends StatelessWidget {
  const _ReceiptScrollableList({required this.productEntitiesList});
  final List<ProductEntity> productEntitiesList;
  final SliverList title = const SliverList(
    delegate: SliverChildListDelegate.fixed([
      _ListHeader(),
    ]),
  );
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        title,
        _ProductEntityListWidget(
          productEntitiesList: productEntitiesList,
        )
      ],
    );
  }
}

class _ListHeader extends StatelessWidget {
  const _ListHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Список покупок'),
        IconButton(
            onPressed: () async {
              final result = await showSortingReceiptDialog(context);
              if(result != null) {
                // ignore: use_build_context_synchronously
                context
                  .read<ReceiptBloc>()
                  .add(ReceiptEvent.sort(sortingFunction: result));
              }
            },
            icon: const Icon(Icons.table_rows_rounded))
      ],
    );
  }
}

class _ProductEntityListWidget extends StatelessWidget {
  const _ProductEntityListWidget(
      {super.key, required this.productEntitiesList});
  final List<ProductEntity> productEntitiesList;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) =>
            ProductEntityCardWidget(productEntity: productEntitiesList[index]),
        childCount: productEntitiesList.length,
      ),
    );
  }
}

class ProductEntityCardWidget extends StatelessWidget {
  const ProductEntityCardWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(productEntity.title),
        Text(productEntity.price.toString())
      ],
    );
  }
}
