part of 'product_details_screen_cubit.dart';

@immutable
abstract class ProductDetailsScreenState {
  ProductEntity product;
  String shopId;
  String error;
}

class ProductDetailsScreenStateInitial extends ProductDetailsScreenState {}

class ProductDetailsScreenStateValue extends ProductDetailsScreenState {
  ProductDetailsScreenStateValue(ProductEntity product, String shopId) {
    this.product = product;
    this.shopId = shopId;
  }
}

class ProductDetailsScreenStateError extends ProductDetailsScreenState {
  ProductDetailsScreenStateError(String error) {
    this.error = error;
  }
}
