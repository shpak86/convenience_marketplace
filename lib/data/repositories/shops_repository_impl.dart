import 'package:convenience_marketplace/di/storage.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/repositories/shops_repository.dart';

class ShopsRepositoryImpl extends ShopsRepository {
  List<ShopEntity> _shops = Storage.shops;
  Map<String, List<ProductEntity>> _products = Storage.products;

  @override
  Future<ShopEntity> getShop(String id) {
    ShopEntity shop;
    var filtered = _shops.where((element) => element.id == id);
    if (filtered.isNotEmpty) {
      shop = filtered.first;
    }
    return Future.delayed(Duration(seconds: 1), () => shop);
  }

  @override
  Future<List<ShopEntity>> getShopsList({SearchParameters parameters}) {
    return Future.delayed(Duration(seconds: 1), () => _shops);
  }

  @override
  Future<ShopEntity> switchFavorite(String id) {
    ShopEntity shop;
    var select = _shops.where((shop) => shop.id == id);
    if (select.isNotEmpty) {
      shop = select.first;
      shop.favorite = !shop.favorite;
    }
    return Future.delayed(Duration(seconds: 1), () => shop);
  }
}
