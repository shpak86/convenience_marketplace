import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/repositories/products_repository.dart';

class ProductsRepositoryInteractor {
  ProductsRepository _repository;

  ProductsRepositoryInteractor(this._repository);

  Future<List<ProductEntity>> getProductsList(String shopId, {SearchParameters parameters}) {
    return _repository.getProductsList(shopId, parameters: parameters);
  }

  Future<ProductEntity> getProduct(String shopId, String productId) {
    return _repository.getProduct(shopId, productId);
  }
  
  Future<ProductEntity> switchProduct(String shopId, String productId) {
    return _repository.switchFavorite(shopId, productId);
  }
}
