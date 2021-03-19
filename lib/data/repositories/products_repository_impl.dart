import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  List<ProductEntity> _products = [
    ProductEntity("0", "Product 0", 1.0, "kg"),
    ProductEntity("1", "Product 1", 2.0, "kg"),
    ProductEntity("2", "Product 2", 3.0, "kg"),
  ];

  @override
  Future<ProductEntity> getProduct(String shopId, String productId) async {
    ProductEntity product;
    // shopId is not used now
    var select = _products.where((element) => element.id == productId);
    if (select.isNotEmpty) {
      product = select.first;
    }
    return Future.delayed(Duration(seconds: 1), () => product);
  }

  @override
  Future<List<ProductEntity>> getProductsList(String shopId, {SearchParameters parameters}) async {
    return Future.delayed(Duration(seconds: 1), () => _products);
  }
}
