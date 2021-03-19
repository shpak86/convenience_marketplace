import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  List<ProductEntity> _productsInCart = [];

  @override
  Future<List<ProductEntity>> getProducts() async {
    return Future.delayed(Duration(seconds: 1), () => _productsInCart);
  }

  @override
  add(ProductEntity productEntity) {
    _productsInCart.add(productEntity);
  }

  @override
  remove(ProductEntity productEntity) {
    _productsInCart.remove(productEntity);
  }
}
