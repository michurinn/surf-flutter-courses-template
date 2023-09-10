// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_typography.dart';
import 'package:surf_flutter_courses_template/bloc/bloc/receipt_bloc.dart';
import 'package:surf_flutter_courses_template/data/domain/category_with_products_model.dart';
import 'package:surf_flutter_courses_template/data/domain/product_in_cart.dart';
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
        backgroundColor: Colors.white,
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _ReceiptScrollableList(
                    isSorted: false, productEntitiesList: productEntityList),
              ),
              sorted: (productEntityList) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  icon: SvgPicture.asset(
                    'lib/assets/icons/catalog.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: 'Каталог'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'lib/assets/icons/search.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: 'Поиск'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'lib/assets/icons/cart.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: 'Корзина'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'lib/assets/icons/person.svg',
                    width: 24,
                    height: 24,
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
  final List<CategoryWithProductsModel> productEntitiesList;
  final bool isSorted;
  @override
  Widget build(BuildContext context) {
    final summuryList =
        List<CategoryWithProductsModel>.from(productEntitiesList)
            .expand((e) => e.products)
            .toList();
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _ListHeader(isSorted: isSorted,products: summuryList),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _ProductCategoryListWidget(
              productEntitiesList: productEntitiesList,
            ),
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
              [_ListTailWidget(productEntitiesList: summuryList)]),
        ),
      ],
    );
  }
}
// Заголовок с кнопкой Сортировать
class _ListHeader extends SliverPersistentHeaderDelegate {
  const _ListHeader({required this.isSorted, required this.products});
  final bool isSorted;
  final List<ProductInCart> products;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Align(
      child: ColoredBox(
        color: Colors.white,
        child: Row(
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
                    final result = await showSortingReceiptDialog(context,products);
                    if (result != null) {
                      // ignore: use_build_context_synchronously
                      context
                          .read<ReceiptBloc>()
                          .add(ReceiptEvent.sort(sortedList: result));
                    } else {
                      // ignore: use_build_context_synchronously
                      context
                          .read<ReceiptBloc>()
                          .add(const ReceiptEvent.load(receiptId: ''));
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
        ),
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
// Виджет списка категорий с товарами
class _ProductCategoryListWidget extends StatelessWidget {
  const _ProductCategoryListWidget({required this.productEntitiesList});
  final List<CategoryWithProductsModel> productEntitiesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: productEntitiesList
          .map((e) => ProducCategoryWidget(
                productEntity: e,
              ))
          .toList(),
    );
  }
}
// Виджет категории с товарами
class ProducCategoryWidget extends StatelessWidget {
  const ProducCategoryWidget({required this.productEntity, super.key});
  final CategoryWithProductsModel productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            productEntity.name.name,
            style: AppTypography.title2,
          ),
        ),
        ...productEntity.products.expand((element) => [
              ProductCard(
                entity: element,
              )
            ])
      ],
    );
  }
}
// Конец чека с итоговыми суммами
class _ListTailWidget extends StatelessWidget {
  const _ListTailWidget({required this.productEntitiesList});
  final List<ProductInCart> productEntitiesList;

  @override
  Widget build(BuildContext context) {
    // Сумма всех цен
    final sum = productEntitiesList
            .map((e) => e.purchaseAmount)
            .reduce((value, element) => value + element) /
        100;
    final sale = productEntitiesList
            .map((e) => e.sale)
            .reduce((value, element) => value + element) /
        100;
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
              style: AppTypography.title2,
            ),
            Text(
              '$result руб',
              style: AppTypography.title2,
            ),
          ],
        ),
      ],
    );
  }
}
