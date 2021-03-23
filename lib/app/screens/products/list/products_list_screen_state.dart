part of 'products_list_screen_cubit.dart';

@immutable
abstract class ProductsListScreenState {
  List<ProductEntity> products;
  String error;
}

class ProductsListScreenStateInitial extends ProductsListScreenState {}

class ProductsListScreenStateValue extends ProductsListScreenState {
  ProductsListScreenStateValue(List<ProductEntity> products) {
    this.products = products;
  }
}

class ProductsListScreenStateError extends ProductsListScreenState {
  ProductsListScreenStateError(String error) {
    this.error = error;
  }
}
