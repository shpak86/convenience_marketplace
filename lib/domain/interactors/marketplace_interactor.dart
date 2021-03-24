import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/search_parameters.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/interactors/cart_repository_interactor.dart';
import 'package:convenience_marketplace/domain/interactors/products_repository_interactor.dart';
import 'package:convenience_marketplace/domain/interactors/search_repository_interactor.dart';
import 'package:convenience_marketplace/domain/interactors/shops_repository_interactor.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';

class MarketplaceInteractor extends UseCase {
  ProductsRepositoryInteractor _productsRepositoryInteractor;
  ShopsRepositoryInteractor _shopsRepositoryInteractor;
  CartRepositoryInteractor _cartRepositoryInteractor;
  SearchRepositoryInteractor _searchRepositoryInteractor;

  MarketplaceInteractor(
    this._productsRepositoryInteractor,
    this._shopsRepositoryInteractor,
    this._cartRepositoryInteractor,
    this._searchRepositoryInteractor,
  );

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

  @override
  Future<List<CartItemEntity>> getCart() {
    return _cartRepositoryInteractor.getCart();
  }

  @override
  Future<List<CartItemEntity>> addProductToCart(String shopId, String productId) {
    return _cartRepositoryInteractor.add(shopId, productId);
  }

  @override
  Future<List<CartItemEntity>> removeProductFromCart(String shopId, String productId) {
    return _cartRepositoryInteractor.remove(shopId, productId);
  }

  @override
  Future<List<CartItemEntity>> findProducts({String namePattern}) {
    return _searchRepositoryInteractor.findProducts(namePattern: namePattern);
  }
}
