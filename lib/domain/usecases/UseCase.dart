import 'package:convenience_marketplace/domain/entities/ProductEntity.dart';

abstract class UseCase {
  Future<List<ProductEntity>> getProductsList({String label, int category});

  Future<ProductEntity> getProduct(int uuid);
}
