import 'package:convenience_marketplace/domain/entities/ShopEntity.dart';
import 'package:convenience_marketplace/domain/repositories/ShopsRepository.dart';

class ShopRepositoryInteractor {
  ShopsRepository _repository;

  ShopRepositoryInteractor(this._repository);

  Future<ShopEntity> getShop(String uuid) async {
    return _repository.getShop(uuid);
  }

  Future<List<ShopEntity>> getShopsList({String name, String category, String description}) async {
    return _repository.getShopsList(name: name, category: category, description: description);
  }
}
