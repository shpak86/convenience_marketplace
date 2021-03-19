import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/repositories/cart_repository.dart';

class CartRepositoryInteractor {
  CartRepository _repository;

  CartRepositoryInteractor(this._repository);

  Future<List<ProductEntity>> getProducts() async {
    return _repository.getProducts();
  }

  add(ProductEntity productEntity) {
    _repository.add(productEntity);
  }

  remove(ProductEntity productEntity) {
    _repository.remove(productEntity);
  }
}
