part of 'catalog_screen_cubit.dart';

@immutable
abstract class CatalogScreenState {
  List<ShopProductEntity> result;
  String error;
}

class CatalogScreenStateInitial extends CatalogScreenState {}

class CatalogScreenStateValue extends CatalogScreenState {
  CatalogScreenStateValue(List<ShopProductEntity> results) {
    this.result = results;
  }
}

class CatalogScreenStateError extends CatalogScreenState {
  CatalogScreenStateError(String error) {
    this.error = error;
  }
}

class CatalogScreenStateProgress extends CatalogScreenState {}
