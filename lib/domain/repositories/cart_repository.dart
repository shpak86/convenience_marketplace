import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';

abstract class CartRepository {
  Future<List<ShopProductEntity>> getCart();

  Future<List<ShopProductEntity>> add(String shopId, String productId);

  Future<List<ShopProductEntity>> remove(String shopId, String productId, {int quantity});

  Future<List<ShopProductEntity>> clean();
}
