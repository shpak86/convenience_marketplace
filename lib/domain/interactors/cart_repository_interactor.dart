import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';
import 'package:convenience_marketplace/domain/repositories/cart_repository.dart';

class CartRepositoryInteractor {
  CartRepository _repository;

  CartRepositoryInteractor(this._repository);

  Future<List<ShopProductEntity>> getCart() async {
    return _repository.getCart();
  }

  Future<List<ShopProductEntity>> add(String shopId, String productId) {
    return _repository.add(shopId, productId);
  }

  Future<List<ShopProductEntity>> remove(String shopId, String productId, {int quantity = 1}) {
    return _repository.remove(shopId, productId, quantity: quantity);
  }

  Future<List<ShopProductEntity>> clean() {
    return _repository.clean();
  }
}
