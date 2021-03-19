import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/repositories/shops_repository.dart';

class ShopsRepositoryImpl extends ShopsRepository {
  List<ShopEntity> _shops = [
    ShopEntity("1", "Shop 1", "Moscow, Russia, 13 Nekrasovka str.", "tools", "Daily fom 9:00 to 18:00", rating: 3.1),
    ShopEntity("2", "Shop 2", "Moscow, Russia, 13 Nekrasovka str.", "Grocery", "Daily fom 9:00 to 18:00"),
    ShopEntity("3", "Shop 3", "Moscow, Russia, 13 Nekrasovka str.", "tools", "Daily fom 9:00 to 18:00"),
    ShopEntity("4", "Shop 4", "Moscow, Russia, 13 Nekrasovka str.", "Mall", "Daily fom 9:00 to 18:00", rating: 4.2),
    ShopEntity("5", "Shop 5", "Moscow, Russia, 13 Nekrasovka str.", "tools", "Daily fom 9:00 to 18:00", rating: 1.2),
  ];

  @override
  Future<ShopEntity> getShop(String uuid) {
    ShopEntity shop;
    var filtered = _shops.where((element) => element.id == uuid);
    if (filtered.isNotEmpty) {
      shop = filtered.first;
    }
    return Future.delayed(Duration(seconds: 1), () => shop);
  }

  @override
  Future<List<ShopEntity>> getShopsList({SearchParameters parameters}) {
    return Future.delayed(Duration(seconds: 1), () => _shops);
  }
}
