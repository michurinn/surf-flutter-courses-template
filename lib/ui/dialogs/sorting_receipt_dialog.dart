import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_typography.dart';
import 'package:surf_flutter_courses_template/data/domain/product_in_cart.dart';
import 'package:surf_flutter_courses_template/data/domain/products_sorting_decorator.dart';

//  Диалог выбора способа сортировки, возвращает функцию-компаратор
Future<List<ProductInCart>?> showSortingReceiptDialog(
    BuildContext context, List<ProductInCart> products) {
  return showModalBottomSheet<List<ProductInCart>?>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          expand: false,
          builder: (context, scrollController) =>
              _SortRadioButtonsListWidget(products),
        );
      },
      context: context);
}

class _SortRadioButtonsListWidget extends StatefulWidget {
  const _SortRadioButtonsListWidget(this.products);
  final List<ProductInCart> products;
  @override
  State<_SortRadioButtonsListWidget> createState() =>
      __SortRadioButtonsListWidgetState();
}

class __SortRadioButtonsListWidgetState
    extends State<_SortRadioButtonsListWidget> {
  late int _character;
  late SortingInterfaceDecorator decorator;
  late ProductsWithoutSorting componentProducts;
  @override
  void initState() {
    super.initState();
    componentProducts = ProductsWithoutSorting(widget.products);
    decorator = NoDecorator(componentProducts);
    _character = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Сортировка',
                style: AppTypography.title1,
              ),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(null),
                  icon: const Icon(Icons.close))
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Без сортировки'),
            leading: Radio<int>(
              activeColor: AppColors.green,
              value: 0,
              groupValue: _character,
              onChanged: (value) {
                decorator = NoDecorator(componentProducts);
                if (value != null) {
                  setState(() {
                    _character = value;
                  });
                }
              },
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('По имени'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('По имени от А до Я'),
            leading: Radio<int>(
              activeColor: AppColors.green,
              value: 1,
              groupValue: _character,
              onChanged: (value) {
                decorator = NameStraightDecorator(componentProducts);
                if (value != null) {
                  setState(() {
                    _character = value;
                  });
                }
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('По имени от Я до А'),
            leading: Radio<int>(
              activeColor: AppColors.green,
              value: 2,
              groupValue: _character,
              onChanged: (value) {
                decorator = NameReverseDecorator(componentProducts);
                if (value != null) {
                  setState(() {
                    _character = value;
                  });
                }
              },
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('По цене'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('По возрастанию'),
            leading: Radio<int>(
              activeColor: AppColors.green,
              value: 3,
              groupValue: _character,
              onChanged: (value) {
                decorator = PriceStraightDecorator(componentProducts);
                if (value != null) {
                  setState(() {
                    _character = value;
                  });
                }
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('По убыванию'),
            leading: Radio<int>(
              activeColor: AppColors.green,
              value: 4,
              groupValue: _character,
              onChanged: (value) {
                decorator = PriceReverseDecorator(componentProducts);
                if (value != null) {
                  setState(() {
                    _character = value;
                  });
                }
              },
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('По типу'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('По типу от А до Я'),
            leading: Radio<int>(
              activeColor: AppColors.green,
              value: 5,
              groupValue: _character,
              onChanged: (value) {
                decorator = CategoryStraightDecorator(componentProducts);
                if (value != null) {
                  setState(() {
                    _character = value;
                  });
                }
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('По типу от Я до А'),
            leading: Radio<int>(
              activeColor: AppColors.green,
              value: 6,
              groupValue: _character,
              onChanged: (value) {
                decorator = CategoryReverseDecorator(componentProducts);
                if (value != null) {
                  setState(() {
                    _character = value;
                  });
                }
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          _SortButtonWidget(
            onPressed: () {
              
              Navigator.of(context).pop(decorator.products);
            },
          )
        ],
      ),
    );
  }
}

// Кнопка Сортировать
class _SortButtonWidget extends StatelessWidget {
  const _SortButtonWidget({required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Text(
          'Готово',
          style: AppTypography.title2.copyWith(color: Colors.white),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 0, color: Colors.transparent),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          minimumSize: const Size(328, 48),
          backgroundColor: AppColors.green,
          textStyle: AppTypography.title2.copyWith(color: Colors.white),
        ));
  }
}
