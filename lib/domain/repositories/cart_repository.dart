import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getCart();

  Future<List<CartItemEntity>> add(String shopId, String productId);

  Future<List<CartItemEntity>> remove(String shopId, String productId);
}
