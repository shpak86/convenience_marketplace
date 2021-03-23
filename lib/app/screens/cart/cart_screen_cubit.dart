import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
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
    _useCase.addProductToCart(shopId, productId).then((value) => emit(CartScreenStateValue(value)));
  }

  removeProduct(String shopId, String productId) {
    _useCase.removeProductFromCart(shopId, productId).then((value) => emit(CartScreenStateValue(value)));
  }
}
