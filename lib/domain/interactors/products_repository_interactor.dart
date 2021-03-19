import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/repositories/products_repository.dart';

class ProductsRepositoryInteractor {
  ProductsRepository productsRepository;

  ProductsRepositoryInteractor(this.productsRepository);

  Future<List<ProductEntity>> getProductsList(String shopId, {SearchParameters parameters}) {
    return productsRepository.getProductsList(shopId, parameters: parameters);
  }

  Future<ProductEntity> getProduct(String shopId, String productId) {
    return productsRepository.getProduct(shopId, productId);
  }
}
