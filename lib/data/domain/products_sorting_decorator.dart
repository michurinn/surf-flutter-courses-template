import 'package:surf_flutter_courses_template/data/domain/product_in_cart.dart';

// Интерфейс компонента
abstract interface class SortingInterface {
  const SortingInterface();
  abstract final List<ProductInCart> products;
}

/// Компонент со списком ProductInCart, до применения сортировки
class ProductsWithoutSorting implements SortingInterface {
  const ProductsWithoutSorting(this.products);
  @override
  final List<ProductInCart> products;
}

/// Базовый класс для декораторов
sealed class SortingInterfaceDecorator implements SortingInterface {
  const SortingInterfaceDecorator(this.sortingInterface);
  final SortingInterface sortingInterface;
}

// Декоратор сортировки по имени
class NameStraightDecorator implements SortingInterfaceDecorator {
  @override
  final SortingInterface sortingInterface;

  const NameStraightDecorator(this.sortingInterface);

  @override
  List<ProductInCart> get products {
    final unsrortedProducts = sortingInterface.products;
    final sortedProducts = unsrortedProducts
      ..sort(
        (a, b) => a.title.compareTo(b.title),
      );
    return sortedProducts;
  }
}

// Декоратор сортировки по имени
class NameReverseDecorator implements SortingInterfaceDecorator {
  @override
  final SortingInterface sortingInterface;

  const NameReverseDecorator(this.sortingInterface);

  @override
  List<ProductInCart> get products {
    final unsrortedProducts = sortingInterface.products;
    final sortedProducts = unsrortedProducts
      ..sort(
        (a, b) => b.title.compareTo(a.title),
      );
    return sortedProducts;
  }
}

// Декоратор сортировки по имени
class PriceStraightDecorator implements SortingInterfaceDecorator {
  @override
  final SortingInterface sortingInterface;

  const PriceStraightDecorator(this.sortingInterface);

  @override
  List<ProductInCart> get products {
    final unsrortedProducts = sortingInterface.products;
    final sortedProducts = unsrortedProducts
      ..sort(
        (a, b) => a.price.compareTo(b.price),
      );
    return sortedProducts;
  }
}

// Декоратор сортировки по имени
class PriceReverseDecorator implements SortingInterfaceDecorator {
  @override
  final SortingInterface sortingInterface;

  const PriceReverseDecorator(this.sortingInterface);

  @override
  List<ProductInCart> get products {
    final unsrortedProducts = sortingInterface.products;
    final sortedProducts = unsrortedProducts
      ..sort(
        (a, b) => b.price.compareTo(a.price),
      );
    return sortedProducts;
  }
}

// Декоратор сортировки по имени
class CategoryStraightDecorator implements SortingInterfaceDecorator {
  @override
  final SortingInterface sortingInterface;

  const CategoryStraightDecorator(this.sortingInterface);

  @override
  List<ProductInCart> get products {
    final unsrortedProducts = sortingInterface.products;
    final sortedProducts = unsrortedProducts
      ..sort(
        (a, b) => a.category.name.compareTo(b.category.name),
      );
    return sortedProducts;
  }
}

// Декоратор сортировки по имени
class CategoryReverseDecorator implements SortingInterfaceDecorator {
  @override
  final SortingInterface sortingInterface;

  const CategoryReverseDecorator(this.sortingInterface);

  @override
  List<ProductInCart> get products {
    final unsrortedProducts = sortingInterface.products;
    final sortedProducts = unsrortedProducts
      ..sort(
        (a, b) => b.category.name.compareTo(a.category.name),
      );
    return sortedProducts;
  }
}

// Отсутствие декоратора, чтобы повесить на RadioButton без сортировки
class NoDecorator implements SortingInterfaceDecorator {
  @override
  final SortingInterface sortingInterface;

  const NoDecorator(this.sortingInterface);

  @override
  List<ProductInCart> get products => sortingInterface.products;
}
