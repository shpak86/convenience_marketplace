import 'package:convenience_marketplace/data/repositories/products_repository_impl.dart';
import 'package:convenience_marketplace/data/repositories/shops_repository_impl.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/interactors/products_repository_interactor.dart';
import 'package:convenience_marketplace/domain/interactors/shops_repository_interactor.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';

class MarketplaceInteractor extends UseCase {
  ProductsRepositoryInteractor _productsRepositoryInteractor = ProductsRepositoryInteractor(ProductsRepositoryImpl());
  ShopsRepositoryInteractor _shopsRepositoryInteractor = ShopsRepositoryInteractor(ShopsRepositoryImpl());

  @override
  Future<ProductEntity> getProduct(String shopId, String productId) {
    return _productsRepositoryInteractor.getProduct(shopId, productId);
  }

  @override
  Future<List<ProductEntity>> getProductsList(String shopId, {SearchParameters parameters}) {
    return _productsRepositoryInteractor.getProductsList(shopId, parameters: parameters);
  }

  @override
  Future<ShopEntity> getShop(String id) {
    return _shopsRepositoryInteractor.getShop(id);
  }

  @override
  Future<List<ShopEntity>> getShopsList({SearchParameters parameters}) {
    return _shopsRepositoryInteractor.getShopsList();
  }

  @override
  Future<ShopEntity> switchFavoriteShop(id) {
    return _shopsRepositoryInteractor.switchFavorite(id);
  }

  @override
  Future<ProductEntity> switchFavoriteProduct(String shopId, String productId) {
    return _productsRepositoryInteractor.switchProduct(shopId, productId);
  }
}
