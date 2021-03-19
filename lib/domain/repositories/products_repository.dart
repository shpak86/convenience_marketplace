import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getProductsList(String shopId, {SearchParameters parameters});

  Future<ProductEntity> getProduct(String shopId, String productId);
}
