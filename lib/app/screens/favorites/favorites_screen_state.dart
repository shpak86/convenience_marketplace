part of 'favorites_screen_cubit.dart';

@immutable
abstract class FavoritesScreenState {
  List<CartItemEntity> favorites;
  String error;
}

class FavoritesScreenStateInitial extends FavoritesScreenState {}

class FavoritesScreenStateValue extends FavoritesScreenState {
  FavoritesScreenStateValue(List<CartItemEntity> favorites) {
    this.favorites = favorites;
  }
}

class FavoritesScreenStateError extends FavoritesScreenState {
  FavoritesScreenStateError(String error) {
    this.error = error;
  }
}
