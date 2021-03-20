import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';

class Storage {
  static String description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  static List<ShopEntity> shops = [
    ShopEntity("1", "Moscow, Russia, Shop 1", description, "Moscow, Russia, 1 Lenina str.", "tools", rating: 3.1),
    ShopEntity("2", "Shop 2", description, "Moscow, Russia, 2 Leninastr.", "Grocery"),
    ShopEntity("3", "Shop 3", description, "Moscow, Russia, 3 Lenina str.", "tools"),
    ShopEntity("4", "Shop 4", description, "Moscow, Russia, 4 Lenina str.", "Mall", rating: 4.2),
    ShopEntity("5", "Shop 5", description, "Moscow, Russia, 5 Lenina str.", "tools", rating: 1.2),
  ];
  static Map<String, List<ProductEntity>> products = {
    "1": [
      ProductEntity("0", "Moscow, Russia, Product 0", description, 1.0, "1 kg", rating: 3.1),
      ProductEntity("1", "Product 1", description, 2.0, "100 g", rating: 2.9),
      ProductEntity("2", "Moscow, Russia, Moscow, Russia, Product 2", description, 3.0, "1 liter", rating: 4.1),
    ],
    "2": [],
    "3": [
      ProductEntity("0", "Product 30", description, 1.0, "1 kg"),
      ProductEntity("1", "Product 31", description, 2.0, "100 g"),
      ProductEntity("2", "Product 32", description, 3.0, "1 liter"),
    ],
    "4": [
      ProductEntity("0", "Product 40", description, 1.0, "1 kg"),
      ProductEntity("2", "Product 42", description, 3.0, "1 liter"),
    ],
    "5": [
      ProductEntity("0", "Product 50", description, 1.0, "1 kg"),
      ProductEntity("1", "Product 51", description, 2.0, "100 g"),
      ProductEntity("2", "Product 52", description, 3.0, "1 liter"),
      ProductEntity("3", "Product 53", description, 3.0, "1 liter"),
      ProductEntity("4", "Product 54", description, 3.0, "1 liter"),
      ProductEntity("5", "Product 55", description, 3.0, "1 liter"),
    ],
  };
}
