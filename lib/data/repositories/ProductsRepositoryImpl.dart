import 'package:convenience_marketplace/domain/entities/ProductEntity.dart';
import 'package:convenience_marketplace/domain/repositories/ProductsRepository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  List<ProductEntity> _products = [
    ProductEntity("0", "Product 0", 1.0, "kg"),
    ProductEntity("1", "Product 1", 2.0, "kg"),
    ProductEntity("2", "Product 2", 3.0, "kg"),
  ];

  @override
  Future<ProductEntity> getProduct(int uuid) async {
    ProductEntity product;
    var select = _products.where((element) => element.uuid == uuid);
    if (select.isNotEmpty) product = select.first;
    return Future.delayed(Duration(seconds: 1), () => product);
  }

  @override
  Future<List<ProductEntity>> getProductsList({String label, int category}) async {
    return Future.delayed(Duration(seconds: 1), () => _products);
  }
}
