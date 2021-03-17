import 'package:convenience_marketplace/domain/entities/ShopEntity.dart';

abstract class ShopsRepository {
  Future<List<ShopEntity>> getShopsList({String name, String category, String description});

  Future<ShopEntity> getShop(String uuid);
}
