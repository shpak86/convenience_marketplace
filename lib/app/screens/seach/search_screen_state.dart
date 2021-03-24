part of 'search_screen_cubit.dart';

@immutable
abstract class SearchScreenState {
  List<CartItemEntity> result;
  String error;
}

class SearchScreenStateInitial extends SearchScreenState {}

class SearchScreenStateValue extends SearchScreenState {
  SearchScreenStateValue(List<CartItemEntity> results) {
    this.result = results;
  }
}

class SearchScreenStateError extends SearchScreenState {
  SearchScreenStateError(String error) {
    this.error = error;
  }
}

class SearchScreenStateProgress extends SearchScreenState {}
