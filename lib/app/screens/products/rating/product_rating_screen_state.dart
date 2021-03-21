part of 'product_rating_screen_cubit.dart';

@immutable
abstract class ProductRatingScreenState {
  ProductEntity product;
  String error;
}

class ProductRatingScreenInitial extends ProductRatingScreenState {}

class ProductRatingScreenValue extends ProductRatingScreenState {
  ProductRatingScreenValue(ProductEntity product) {
    this.product = product;
  }
}

class ProductRatingScreenError extends ProductRatingScreenState {
  ProductRatingScreenError(String error) {
    this.error = error;
  }
}
