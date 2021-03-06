import 'package:convenience_marketplace/di/storage.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {

  @override
  Future<ProductEntity> getProduct(String shopId, String productId) async {
    ProductEntity product;
    List<ProductEntity> select;
    // shopId is not used now
    if (Storage.products.containsKey(shopId)) {
      select = Storage.products[shopId].where((element) => element.id == productId).toList();
      if (select.isNotEmpty) {
        product = select.first;
      }
    }
    return Future.delayed(Duration(seconds: 1), () => product);
  }

  @override
  Future<List<ProductEntity>> getProductsList(String shopId, {SearchParameters parameters}) async {
    return Future.delayed(Duration(seconds: 1), () => Storage.products[shopId]);
  }

  @override
  Future<ProductEntity> switchFavorite(String shopId, String productId) async {
    ProductEntity product = await getProduct(shopId, productId);
    if (product != null) {
      product.favorite = !product.favorite;
    }
    return Future.delayed(Duration(milliseconds: 300), () => product);
  }
}
