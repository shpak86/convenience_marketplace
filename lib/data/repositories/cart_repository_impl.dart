import 'package:convenience_marketplace/di/storage.dart';
import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  Map<String, ShopProductEntity> _cart = Storage.cart;

  @override
  Future<List<ShopProductEntity>> getCart() {
    return Future.delayed(Duration(seconds: 1), () => _cart.values.toList());
  }

  @override
  Future<List<ShopProductEntity>> add(String shopId, String productId) {
    var key = "/$shopId/$productId";
    if (_cart.containsKey(key)) {
      _cart[key].count++;
    } else {
      ShopEntity shop = Storage.shops.where((element) => element.id == shopId).first;
      ProductEntity product = Storage.products[shopId].where((element) => element.id == productId).first;
      _cart[key] = ShopProductEntity(shop, product, 1);
    }
    return Future(() => _cart.values.toList());
  }

  @override
  Future<List<ShopProductEntity>> remove(String shopId, String productId, {int quantity = 1}) {
    var key = "/$shopId/$productId";
    if (_cart.containsKey(key)) {
      _cart[key].count -= quantity;
      if (_cart[key].count <= 0) {
        _cart.remove(key);
      }
    }
    return Future(() => _cart.values.toList());
  }

  @override
  Future<List<ShopProductEntity>> clean() {
    _cart.clear();
    return Future(() => _cart.values.toList());
  }
}
