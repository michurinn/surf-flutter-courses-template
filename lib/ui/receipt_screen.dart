// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_typography.dart';
import 'package:surf_flutter_courses_template/bloc/bloc/receipt_bloc.dart';
import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';
import 'package:surf_flutter_courses_template/ui/dialogs/sorting_receipt_dialog.dart';
import 'package:surf_flutter_courses_template/ui/widgets/product_card.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen(
      {required this.receiptId, required this.receiptDate, super.key});
  final String receiptId;
  final String receiptDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => print('Back arrow pressed'),
            color: AppColors.green,
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                receiptId,
                style: AppTypography.title1.copyWith(color: AppColors.black),
              ),
              Text(
                receiptDate,
                style:
                    AppTypography.subTitle.copyWith(color: AppColors.inactive),
              ),
            ],
          ),
        ),
        body: BlocBuilder<ReceiptBloc, ReceiptState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              empty: () => const Center(
                  child: Text(
                'Здесь пока ничего нет',
                style: AppTypography.title2,
              )),
              loaded: (productEntityList) => Padding(
                padding: const EdgeInsets.all(20),
                child: _ReceiptScrollableList(
                    isSorted: false, productEntitiesList: productEntityList),
              ),
              sorted: (productEntityList) => Padding(
                padding: const EdgeInsets.all(20),
                child: _ReceiptScrollableList(
                    isSorted: true, productEntitiesList: productEntityList),
              ),
              sortedByCategory: (productEntityList) => Padding(
                padding: const EdgeInsets.all(20),
                child: _ReceiptScrollableList(
                    isSorted: true, productEntitiesList: productEntityList),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 3,
            showUnselectedLabels: true,
            unselectedItemColor: Theme.of(context).textTheme.bodyLarge?.color,
            selectedItemColor: AppColors.green,
            selectedLabelStyle: const TextStyle(color: Colors.black),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('lib/assets/icons/catalog.svg'),
                  label: 'Каталог'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('lib/assets/icons/search.svg'),
                  label: 'Поиск'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('lib/assets/icons/cart.svg'),
                  label: 'Корзина'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'lib/assets/icons/person.svg',
                  ),
                  label: 'Личное')
            ]),
      ),
    );
  }
}

// Список товаров в чеке, с заголовком и кнопкой сортировки и Суммами в конце списка
class _ReceiptScrollableList extends StatelessWidget {
  const _ReceiptScrollableList(
      {required this.productEntitiesList, required this.isSorted});
  final List<ProductEntity> productEntitiesList;
  final bool isSorted;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            _ListHeader(
              isSorted: isSorted,
            ),
          ]),
        ),
        _ProductEntityListWidget(
          productEntitiesList: productEntitiesList,
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            _ListTailWidget(
              productEntitiesList: productEntitiesList,
            )
          ]),
        ),
      ],
    );
  }
}

class _ListHeader extends StatelessWidget {
  const _ListHeader({required this.isSorted});
  final bool isSorted;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Список покупок',
          style: AppTypography.title1,
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () async {
                final result = await showSortingReceiptDialog(context);
                if (result != null) {
                  // ignore: use_build_context_synchronously
                  context
                      .read<ReceiptBloc>()
                      .add(ReceiptEvent.sort(sortingFunction: result));
                }
              },
              icon: Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: SvgPicture.asset(
                  'lib/assets/icons/sort_button.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.none,
                ),
              ),
            ),
            if (isSorted)
              Positioned(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: Container(
                    width: 8,
                    height: 8,
                    color: AppColors.green,
                  ),
                ),
                bottom: 12,
                right: 12,
              ),
          ],
        )
      ],
    );
  }
}

class _ProductEntityListWidget extends StatelessWidget {
  const _ProductEntityListWidget({required this.productEntitiesList});
  final List<ProductEntity> productEntitiesList;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) =>
            ProductEntityCardWidget(productEntity: productEntitiesList[index]),
        childCount: productEntitiesList.length,
      ),
    );
  }
}

class ProductEntityCardWidget extends StatelessWidget {
  const ProductEntityCardWidget({required this.productEntity, super.key});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return ProductCard(entity: productEntity);
  }
}

class _ListTailWidget extends StatelessWidget {
  const _ListTailWidget({required this.productEntitiesList});
  final List<ProductEntity> productEntitiesList;

  @override
  Widget build(BuildContext context) {
    // Сумма всех цен
    final sum = productEntitiesList
        .map((e) => e.price)
        .reduce((value, element) => value + element)/100;
    final sale = productEntitiesList
        .map((e) => e.sale)
        .reduce((value, element) => value + element);
    final result = sum - sale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(
          height: 24,
        ),
        const Text(
          'В вашей покупке',
          style: AppTypography.title2,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${productEntitiesList.length} товаров',
              style: AppTypography.textNormal,
            ),
            Text(
              '$sum руб',
              style: AppTypography.textBold,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Скидка',
              style: AppTypography.textNormal,
            ),
            Text(
              '-$sale руб',
              style: AppTypography.textBold,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Итого',
              style: AppTypography.textNormal,
            ),
            Text(
              '$result руб',
              style: AppTypography.textBold,
            ),
          ],
        ),
      ],
    );
  }
}
