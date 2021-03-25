import 'package:convenience_marketplace/di/storage.dart';
import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  var _products = Storage.products;
  var _shops = Storage.shops;

  @override
  Future<List<CartItemEntity>> findProducts({String namePattern}) {
    List<CartItemEntity> result = [];
    if (namePattern != null && namePattern.isNotEmpty) {
      _products.forEach((shopId, productsList) {
        ShopEntity shop = _shops.firstWhere((element) => element.id == shopId);
        if (shop != null) {
          productsList
              .where((element) => element.name
                  .toLowerCase()
                  .contains(namePattern.toLowerCase()))
              .forEach((product) {
            result.add(CartItemEntity(shop, product, 0));
          });
        }
      });
    }
    return Future.delayed(Duration(seconds: 1), () => result);
  }

  @override
  Future<List<CartItemEntity>> getFavorites() {
    List<CartItemEntity> result = [];
    _products.forEach((shopId, productsList) {
      ShopEntity shop = _shops.firstWhere((element) => element.id == shopId);
      if (shop != null) {
        productsList.where((element) => element.favorite).forEach((product) {
          result.add(CartItemEntity(shop, product, 0));
        });
      }
    });
    return Future.delayed(Duration(seconds: 1), () => result);
  }
}
