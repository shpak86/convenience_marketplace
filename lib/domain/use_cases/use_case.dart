import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';

abstract class UseCase {
  Future<List<ShopEntity>> getShopsList({SearchParameters parameters});

  Future<ShopEntity> getShop(String id);

  Future<List<ProductEntity>> getProductsList(String shopId);

  Future<ProductEntity> getProduct(String shopId, String productId);
}