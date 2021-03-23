import 'package:convenience_marketplace/di/storage.dart';
import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  Map<String, CartItemEntity> _cart = Storage.cart;

  @override
  Future<List<CartItemEntity>> getCart() {
    return Future.delayed(Duration(seconds: 1), () => _cart.values.toList());
  }

  @override
  Future<List<CartItemEntity>> add(String shopId, String productId) {
    var key = "/$shopId/$productId";
    if (_cart.containsKey(key)) {
      _cart[key].count++;
    } else {
      ShopEntity shop = Storage.shops.where((element) => element.id == shopId).first;
      ProductEntity product = Storage.products[shopId].where((element) => element.id == productId).first;
      _cart[key] = CartItemEntity(shop, product, 1);
    }
    return Future(() => _cart.values.toList());
  }

  @override
  Future<List<CartItemEntity>> remove(String shopId, String productId) {
    var key = "/$shopId/$productId";
    if (_cart.containsKey(key)) {
      _cart[key].count--;
      if (_cart[key].count <= 0) {
        _cart.remove(key);
      }
    }
    return Future(() => _cart.values.toList());
  }
}
