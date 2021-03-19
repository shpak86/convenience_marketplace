part of 'product_details_screen_cubit.dart';

@immutable
abstract class ProductDetailsScreenState {
  ProductEntity value;
  String error;
}

class ProductDetailsScreenStateInitial extends ProductDetailsScreenState {}

class ProductDetailsScreenStateValue extends ProductDetailsScreenState {
  ProductDetailsScreenStateValue(ProductEntity productEntity) {
    value = productEntity;
  }
}

class ProductDetailsScreenStateError extends ProductDetailsScreenState {

  ProductDetailsScreenStateError(String error){
    this.error = error;
  }
}
