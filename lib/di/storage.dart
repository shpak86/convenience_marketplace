import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';

class Storage {
  static String description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  static List<ShopEntity> shops = [
    ShopEntity("1", "Megamall", description, "Moscow, Russia, 1 Lenina str.", "tools", rating: 3.1, imageUri: "assets/images/supermarket.png"),
    ShopEntity("2", "Coffee & sweets", description, "Moscow, Russia, 2 Lenina str.", "Grocery"),
    ShopEntity("3", "Fish bay", description, "Moscow, Russia, 3 Lenina str.", "tools", imageUri: "assets/images/shopping.png"),
    ShopEntity("4", "Susi and other fresh Japanese food directly from Tokyo", description, "Moscow, Russia, 4 Lenina str.", "Mall", rating: 4.2, imageUri: "assets/images/supermarket.png"),
    ShopEntity("5", "Vusal", description, "Moscow, Russia, 5 Lenina str.", "tools", rating: 1.2, imageUri: "assets/images/shopping.png"),
  ];
  static Map<String, List<ProductEntity>> products = {
    "1": [
      ProductEntity("0", "Moscow, Russia, Product 0", description, 1.0, "1 kg", rating: 3.1, imageUri: "assets/images/product1.png"),
      ProductEntity("1", "Product 1", description, 2.0, "100 g", rating: 2.9, imageUri: "assets/images/product2.png"),
      ProductEntity("2", "Moscow, Russia, Moscow, Russia, Product 2", description, 3.0, "1 liter", rating: 4.1, imageUri: "assets/images/product3.png"),
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
