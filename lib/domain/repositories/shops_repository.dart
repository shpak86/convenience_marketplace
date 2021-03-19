import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';

abstract class ShopsRepository {
  Future<List<ShopEntity>> getShopsList({SearchParameters parameters});

  Future<ShopEntity> getShop(String uuid);
}
