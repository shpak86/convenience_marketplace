part of 'products_list_screen_cubit.dart';

@immutable
abstract class ProductsListScreenState {
  List<ProductEntity> value;
  String error;
}

class ProductsListScreenStateInitial extends ProductsListScreenState {}

class ProductsListScreenStateValue extends ProductsListScreenState {
  ProductsListScreenStateValue(List<ProductEntity> value) {
    this.value = value;
  }
}

class ProductsListScreenStateError extends ProductsListScreenState {
  ProductsListScreenStateError(String error) {
    this.error = error;
  }
}
