import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/di/storage.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {

  List<ShopEntity> _shops = Storage.shops;
  Map<String, List<ProductEntity>> _products = Storage.products;

  @override
  Future<ProductEntity> getProduct(String shopId, String productId) async {
    ProductEntity product;
    List<ProductEntity> select;
    // shopId is not used now
    if (_products.containsKey(shopId)) {
      select = _products[shopId].where((element) => element.id == productId).toList();
      if (select.isNotEmpty) {
        product = select.first;
      }
    }
    return Future.delayed(Duration(seconds: 1), () => product);
  }

  @override
  Future<List<ProductEntity>> getProductsList(String shopId, {SearchParameters parameters}) async {
    return Future.delayed(Duration(seconds: 1), () => _products[shopId]);
  }
}
