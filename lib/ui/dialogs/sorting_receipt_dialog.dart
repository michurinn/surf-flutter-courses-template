import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';

Future<Comparator<ProductEntity>?> showSortingReceiptDialog(
    BuildContext context) {
  return showModalBottomSheet<Comparator<ProductEntity>>(
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
  late _SortVariant _character = _SortVariant.none();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Список покупок'),
            IconButton(
                onPressed: () => Navigator.of(context).pop(null),
                icon: const Icon(Icons.close))
          ],
        ),
        ListTile(
          title: const Text('Без сортировки'),
          leading: Radio<_SortVariant>(
            value: _SortVariant.none(),
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
        const Text('По имени'),
        ListTile(
          title: const Text('По имени от А до Я'),
          leading: Radio<_SortVariant>(
            value: _SortVariant.byNameStraight(),
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
          title: const Text('По имени от Я до А'),
          leading: Radio<_SortVariant>(
            value: _SortVariant.byNameRevrse(),
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
        const Text('По цене'),
        ListTile(
          title: const Text('По возрастанию'),
          leading: Radio<_SortVariant>(
            value: _SortVariant.byPriceStraight(),
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
          title: const Text('По убыванию'),
          leading: Radio<_SortVariant>(
            value: _SortVariant.byPriceRevrse(),
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
        const Text('По типу'),
        ListTile(
          title: const Text('По типу от А до Я'),
          leading: Radio<_SortVariant>(
            value: _SortVariant.byTypeStraight(),
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
          title: const Text('По типу от Я до А'),
          leading: Radio<_SortVariant>(
            value: _SortVariant.byTypeRevrse(),
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
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop(_character.comparator);
          },
          child: const Text('GO!'),
        )
      ],
    );
  }
}

// Класс для хранения способа сортирвки
class _SortVariant {
  _SortVariant.none() : comparator = null;
  _SortVariant.byNameStraight()
      : comparator = ((a, b) => a.title.compareTo(b.title));
  _SortVariant.byNameRevrse()
      : comparator = ((a, b) => b.title.compareTo(a.title));
  _SortVariant.byPriceStraight()
      : comparator = ((a, b) => a.price.compareTo(b.price));
  _SortVariant.byPriceRevrse()
      : comparator = ((a, b) => b.price.compareTo(a.price));
  _SortVariant.byTypeStraight()
      : comparator = ((a, b) => a.category.name.compareTo(b.category.name));
  _SortVariant.byTypeRevrse()
      : comparator = ((a, b) => b.category.name.compareTo(a.category.name));
  final Comparator<ProductEntity>? comparator;
}
