part of 'favorites_screen_cubit.dart';

@immutable
abstract class FavoritesScreenState {
  List<ShopProductEntity> favorites;
  String error;
}

class FavoritesScreenStateInitial extends FavoritesScreenState {}

class FavoritesScreenStateValue extends FavoritesScreenState {
  FavoritesScreenStateValue(List<ShopProductEntity> favorites) {
    this.favorites = favorites;
  }
}

class FavoritesScreenStateError extends FavoritesScreenState {
  FavoritesScreenStateError(String error) {
    this.error = error;
  }
}
