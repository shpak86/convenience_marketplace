import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'cart_screen_state.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  UseCase _useCase = DependencyProvider().useCase;

  CartScreenCubit() : super(CartScreenStateInitial());

  getItems() {
    _useCase.getCart().then((value) => emit(CartScreenStateValue(value)));
  }

  addProduct(String shopId, String productId) {
    _useCase.addToCart(shopId, productId).then((value) => emit(CartScreenStateValue(value)));
  }

  removeProduct(String shopId, String productId, {int quantity = 1}) {
    _useCase.removeFromCart(shopId, productId, quantity: quantity).then((value) => emit(CartScreenStateValue(value)));
  }
}
