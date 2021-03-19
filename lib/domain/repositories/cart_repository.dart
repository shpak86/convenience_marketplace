import 'package:convenience_marketplace/domain/entities/product_entity.dart';

abstract class CartRepository {
  Future<List<ProductEntity>> getProducts();

  add(ProductEntity productEntity);

  remove(ProductEntity productEntity);
}
