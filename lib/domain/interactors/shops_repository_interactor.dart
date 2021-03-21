import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/repositories/shops_repository.dart';

class ShopsRepositoryInteractor {
  ShopsRepository _repository;

  ShopsRepositoryInteractor(this._repository);

  Future<ShopEntity> getShop(String id) async {
    return _repository.getShop(id);
  }

  Future<List<ShopEntity>> getShopsList({SearchParameters parameters}) async {
    return _repository.getShopsList();
  }

  Future<ShopEntity> switchFavorite(String id) {
    return _repository.switchFavorite(id);
  }
  
}
