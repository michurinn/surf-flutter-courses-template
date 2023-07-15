import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/domain/product_entity.dart';

Future<Comparator?> showSortingReceiptDialog(BuildContext context) {
  return showModalBottomSheet<Comparator>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return const _SortRadioButtonsListWidget();
      },
      context: context);
}

enum SortVariants {
  none(null),
  byNameStraight((ProductEntity a, ProductEntity b) => a..compareTo(b.price));
  byNameRevrse((ProductEntity a, ProductEntity b) => b.price.compareTo(a.price)),
  byPriceStraight((ProductEntity a, ProductEntity b) => a.price.compareTo(b.price)),
  byPriceRevrse((ProductEntity a, ProductEntity b) => b.price.compareTo(a.price)),
  byTypeStraight(),
  byTypeRevrse();
  const SortVariants(this.comparator);
  final Comparator<ProductEntity>? comparator; 
}

class _SortRadioButtonsListWidget extends StatefulWidget {
  const _SortRadioButtonsListWidget();

  @override
  State<_SortRadioButtonsListWidget> createState() =>
      __SortRadioButtonsListWidgetState();
}

class __SortRadioButtonsListWidgetState
    extends State<_SortRadioButtonsListWidget> {
  SortVariants? _character = SortVariants.none;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Список покупок'),
            IconButton(
                onPressed: () => Navigator.of(context).pop(false),
                icon: const Icon(Icons.close))
          ],
        ),
        ListTile(
          title: const Text('Без сортировки'),
          leading: Radio<SortVariants>(
            value: SortVariants.none,
            groupValue: _character,
            onChanged: (SortVariants? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        const Divider(),
        const Text('По имени'),
        ListTile(
          title: const Text('По имени от А до Я'),
          leading: Radio<SortVariants>(
            value: SortVariants.byNameStraight,
            groupValue: _character,
            onChanged: (SortVariants? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('По имени от Я до А'),
          leading: Radio<SortVariants>(
            value: SortVariants.byNameRevrse,
            groupValue: _character,
            onChanged: (SortVariants? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        const Divider(),
        const Text('По цене'),
        ListTile(
          title: const Text('По возрастанию'),
          leading: Radio<SortVariants>(
            value: SortVariants.byPriceStraight,
            groupValue: _character,
            onChanged: (SortVariants? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('По убыванию'),
          leading: Radio<SortVariants>(
            value: SortVariants.byPriceRevrse,
            groupValue: _character,
            onChanged: (SortVariants? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        const Divider(),
        const Text('По типу'),
        ListTile(
          title: const Text('По типу от А до Я'),
          leading: Radio<SortVariants>(
            value: SortVariants.byTypeStraight,
            groupValue: _character,
            onChanged: (SortVariants? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('По типу от Я до А'),
          leading: Radio<SortVariants>(
            value: SortVariants.byTypeRevrse,
            groupValue: _character,
            onChanged: (SortVariants? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        OutlinedButton(
          onPressed: () {
            result(ProductEntity a, ProductEntity b) =>
                a.price.compareTo(b.price);
            Navigator.of(context).pop(result);
          },
          child: const Text('GO!'),
        )
      ],
    );
  }
}
