import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/repositories/cart_repository.dart';

class CartRepositoryInteractor {
  CartRepository _repository;

  CartRepositoryInteractor(this._repository);

  Future<List<CartItemEntity>> getCart() async {
    return _repository.getCart();
  }

  Future<List<CartItemEntity>> add(String shopId, String productId) {
    return _repository.add(shopId, productId);
  }

  Future<List<CartItemEntity>> remove(String shopId, String productId) {
    return _repository.remove(shopId, productId);
  }
}
