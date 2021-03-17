import 'package:convenience_marketplace/domain/entities/ProductEntity.dart';
import 'package:convenience_marketplace/domain/repositories/ProductsRepository.dart';

class ProductsRepositoryInteractor {
  ProductsRepository productsRepository;

  ProductsRepositoryInteractor(this.productsRepository);

  Future<List<ProductEntity>> getProductsList({String label, int category}) {
    return productsRepository.getProductsList(label: label, category: category);
  }

  Future<ProductEntity> getProduct(int uuid) {
    return productsRepository.getProduct(uuid);
  }
}
