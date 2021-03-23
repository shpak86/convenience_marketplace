part of 'shop_details_screen_cubit.dart';

@immutable
abstract class ShopDetailsScreenState {
  ShopEntity shop;
  String error;
}

class ShopDetailsInitial extends ShopDetailsScreenState {}

class ShopDetailsValue extends ShopDetailsScreenState {
  ShopDetailsValue(ShopEntity shop) {
    this.shop = shop;
  }
}

class ShopDetailsError extends ShopDetailsScreenState {
  ShopDetailsError(String error) {
    this.error = error;
  }
}
