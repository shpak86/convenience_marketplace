part of 'shops_list_screen_cubit.dart';

@immutable
abstract class ShopsListScreenState {
  List<ShopEntity> value;
  String error;
}

class ShopsListScreenStateInitial extends ShopsListScreenState {}

class ShopsListScreenStateUpdate extends ShopsListScreenState {
  ShopsListScreenStateUpdate(List<ShopEntity> value) {
    this.value = value;
  }
}

class ShopsListScreenStateError extends ShopsListScreenState {
  ShopsListScreenStateError(String error) {
    this.error = error;
  }
}
