import 'package:convenience_marketplace/domain/entities/ProductEntity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getProductsList({String label, int category});

  Future<ProductEntity> getProduct(int uuid);
}
