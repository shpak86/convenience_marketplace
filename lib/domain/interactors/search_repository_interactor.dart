import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
import 'package:convenience_marketplace/domain/repositories/search_repository.dart';

class SearchRepositoryInteractor {
  SearchRepository _repository;

  SearchRepositoryInteractor(this._repository);

  Future<List<CartItemEntity>> findProducts({String namePattern}){
    return _repository.findProducts(namePattern: namePattern);
  }

  Future<List<CartItemEntity>> getFavorites() {
    return _repository.getFavorites();
  }

}