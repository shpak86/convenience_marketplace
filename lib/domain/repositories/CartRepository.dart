import 'package:convenience_marketplace/domain/entities/ProductEntity.dart';

abstract class CartRepository {
  Future<List<ProductEntity>> getProducts();

  add(ProductEntity productEntity);

  remove(ProductEntity productEntity);
}
