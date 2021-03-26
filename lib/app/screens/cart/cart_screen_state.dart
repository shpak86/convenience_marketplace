part of 'cart_screen_cubit.dart';

@immutable
abstract class CartScreenState {
  List<ShopProductEntity> items;
  String error;
}

class CartScreenStateInitial extends CartScreenState {}

class CartScreenStateValue extends CartScreenState {
  CartScreenStateValue(List<ShopProductEntity> items) {
    this.items = items;
  }
}

class CartScreenStateError extends CartScreenState {
  CartScreenStateError(String error) {
    this.error = error;
  }
}
