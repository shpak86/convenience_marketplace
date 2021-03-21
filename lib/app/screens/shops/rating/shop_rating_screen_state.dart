part of 'shop_rating_screen_cubit.dart';

@immutable
abstract class ShopRatingScreenState {
  ShopEntity shop;
  String error;
}

class ShopRatingScreenInitial extends ShopRatingScreenState {}

class ShopRatingScreenValue extends ShopRatingScreenState {
  ShopRatingScreenValue(ShopEntity shop) {
    this.shop = shop;
  }
}

class ShopRatingScreenError extends ShopRatingScreenState {
  ShopRatingScreenError(String error) {
    this.error = error;
  }
}
