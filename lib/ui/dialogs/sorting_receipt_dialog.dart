import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_typography.dart';
import 'package:surf_flutter_courses_template/data/domain/product_in_cart.dart';
//  Диалог выбора способа сортировки, возвращает функцию-компаратор
Future<Comparator<ProductInCart>?> showSortingReceiptDialog(
    BuildContext context) {
  return showModalBottomSheet<Comparator<ProductInCart>>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          expand: false,
          builder: (context, scrollController) =>
              const _SortRadioButtonsListWidget(),
        );
      },
      context: context);
}

class _SortRadioButtonsListWidget extends StatefulWidget {
  const _SortRadioButtonsListWidget();

  @override
  State<_SortRadioButtonsListWidget> createState() =>
      __SortRadioButtonsListWidgetState();
}

class __SortRadioButtonsListWidgetState
    extends State<_SortRadioButtonsListWidget> {
  late _SortVariant _character;
  late List<_SortVariant> sortVariantsList;
  @override
  void initState() {
    super.initState();
    sortVariantsList = [
      _SortVariant.none(),
      _SortVariant.byNameStraight(),
      _SortVariant.byNameRevrse(),
      _SortVariant.byPriceStraight(),
      _SortVariant.byPriceRevrse(),
      _SortVariant.byTypeStraight(),
      _SortVariant.byTypeRevrse()
    ];
    // По умолчанию отмечкено поле Без сортировки
    _character = sortVariantsList[0];
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
            leading: Radio<_SortVariant>(
              activeColor: AppColors.green,
              value: sortVariantsList[0],
              groupValue: _character,
              onChanged: (value) {
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
            leading: Radio<_SortVariant>(
              activeColor: AppColors.green,
              value: sortVariantsList[1],
              groupValue: _character,
              onChanged: (value) {
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
            leading: Radio<_SortVariant>(
              activeColor: AppColors.green,
              value: sortVariantsList[2],
              groupValue: _character,
              onChanged: (value) {
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
            leading: Radio<_SortVariant>(
              activeColor: AppColors.green,
              value: sortVariantsList[3],
              groupValue: _character,
              onChanged: (value) {
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
            leading: Radio<_SortVariant>(
              activeColor: AppColors.green,
              value: sortVariantsList[4],
              groupValue: _character,
              onChanged: (value) {
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
            leading: Radio<_SortVariant>(
              activeColor: AppColors.green,
              value: sortVariantsList[5],
              groupValue: _character,
              onChanged: (value) {
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
            leading: Radio<_SortVariant>(
              activeColor: AppColors.green,
              value: sortVariantsList[6],
              groupValue: _character,
              onChanged: (value) {
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
              Navigator.of(context).pop(_character.comparator);
            },
          )
        ],
      ),
    );
  }
}

// Класс для хранения способа сортирвки
class _SortVariant {
  _SortVariant.none() : comparator = null;
  _SortVariant.byNameStraight()
      : comparator = ((a, b) {
          // Поскольку сортировка по цене и названию влияет только на порядок карточек в категории, но не самих категорий
          // ТЗ п.1.6 - Порядок категорий — произвольный. Сортировка влияет на порядок товаров внутри категории.
          if (a.category == b.category) {
            return a.title.compareTo(b.title);
          } else {
            return 0;
          }
        });
  _SortVariant.byNameRevrse()
      : comparator = ((a, b) {
          if (a.category == b.category) {
            return b.title.compareTo(a.title);
          } else {
            return 0;
          }
        });
  _SortVariant.byPriceStraight()
      : comparator = ((a, b) {
          if (a.category == b.category) {
            return a.purchaseAmount.compareTo(b.purchaseAmount);
          } else {
            return 0;
          }
        });
  _SortVariant.byPriceRevrse()
      : comparator = ((a, b) {
          if (a.category == b.category) {
            return b.purchaseAmount.compareTo(a.purchaseAmount);
          } else {
            return 0;
          }
        });
  _SortVariant.byTypeStraight()
      : comparator = ((a, b) => a.category.name.compareTo(b.category.name));
  _SortVariant.byTypeRevrse()
      : comparator = ((a, b) => b.category.name.compareTo(a.category.name));
  final Comparator<ProductInCart>? comparator;
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
