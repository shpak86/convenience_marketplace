import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';
import 'package:convenience_marketplace/domain/repositories/search_repository.dart';

class SearchRepositoryInteractor {
  SearchRepository _repository;

  SearchRepositoryInteractor(this._repository);

  Future<List<ShopProductEntity>> findProducts({String namePattern}){
    return _repository.findProducts(namePattern: namePattern);
  }

  Future<List<ShopProductEntity>> getFavorites() {
    return _repository.getFavorites();
  }

}