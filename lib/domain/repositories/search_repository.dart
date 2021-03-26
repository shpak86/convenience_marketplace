import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';

abstract class SearchRepository {
  Future<List<ShopProductEntity>> findProducts({String namePattern});

  Future<List<ShopProductEntity>> getFavorites();
}
