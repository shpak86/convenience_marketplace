import 'package:convenience_marketplace/data/repositories/cart_repository_impl.dart';
import 'package:convenience_marketplace/data/repositories/products_repository_impl.dart';
import 'package:convenience_marketplace/data/repositories/shops_repository_impl.dart';
import 'package:convenience_marketplace/domain/interactors/cart_repository_interactor.dart';
import 'package:convenience_marketplace/domain/interactors/marketplace_interactor.dart';
import 'package:convenience_marketplace/domain/interactors/products_repository_interactor.dart';
import 'package:convenience_marketplace/domain/interactors/shops_repository_interactor.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';

class DependencyProvider {
  static DependencyProvider _instance = DependencyProvider._internal();

  ProductsRepositoryInteractor _productsRepositoryInteractor;
  ShopsRepositoryInteractor _shopsRepositoryInteractor;
  CartRepositoryInteractor _cartRepositoryInteractor;
  UseCase _useCase;

  UseCase get useCase => _useCase;

  factory DependencyProvider() {
    return _instance;
  }

  DependencyProvider._internal() {
    _productsRepositoryInteractor = ProductsRepositoryInteractor(ProductsRepositoryImpl());
    _shopsRepositoryInteractor = ShopsRepositoryInteractor(ShopsRepositoryImpl());
    _cartRepositoryInteractor = CartRepositoryInteractor(CartRepositoryImpl());
    _useCase = MarketplaceInteractor(_productsRepositoryInteractor, _shopsRepositoryInteractor, _cartRepositoryInteractor);
  }
}
