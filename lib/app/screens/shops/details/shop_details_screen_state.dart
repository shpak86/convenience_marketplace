part of 'shop_details_screen_cubit.dart';

@immutable
abstract class ShopDetailsScreenState {
  ShopEntity value;
  String error;
}

class ShopDetailsInitial extends ShopDetailsScreenState {}

class ShopDetailsValue extends ShopDetailsScreenState {
  ShopDetailsValue(ShopEntity value) {
    this.value = value;
  }
}

class ShopDetailsError extends ShopDetailsScreenState {
  ShopDetailsError(String error) {
    this.error = error;
  }
}
