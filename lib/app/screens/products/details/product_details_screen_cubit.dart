import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'product_details_screen_state.dart';

class ProductDetailsScreenCubit extends Cubit<ProductDetailsScreenState> {
  ProductDetailsScreenCubit() : super(ProductDetailsScreenStateInitial());

  UseCase _useCase = DependencyProvider().useCase;

  getProduct(String shopId, String productId) {
    _useCase.getProduct(shopId, productId).then((value) => emit(ProductDetailsScreenStateValue(value, shopId)));
  }

  switchFavorite(String shopId, String productId) {
    _useCase.switchFavoriteProduct(shopId, productId).then((value) => emit(ProductDetailsScreenStateValue(value, shopId)));
  }

  addToCart(String shopId, String productId) {
    _useCase.addProductToCart(shopId, productId);
  }
}
