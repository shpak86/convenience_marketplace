import 'package:convenience_marketplace/domain/entities/ShopEntity.dart';
import 'package:convenience_marketplace/domain/repositories/ShopsRepository.dart';

class ShopsRepositoryImpl extends ShopsRepository {
  List<ShopEntity> _shops = [
    ShopEntity("1", "Shop", "Moscow, Russia, 13 Nekrasovka str.", "tools", "Daily fom 9:00 to 18:00")
  ];

  @override
  Future<ShopEntity> getShop(String uuid) {
    ShopEntity shop;
    var filtered = _shops.where((element) => element.uuid == uuid);
    if (filtered.isNotEmpty) shop = filtered.first;
    return Future.delayed(Duration(seconds: 1), () => shop);
  }

  @override
  Future<List<ShopEntity>> getShopsList({String name, String category, String description}) {
    return Future.delayed(Duration(seconds: 1), () => _shops);
  }
}
