import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'favorites_screen_state.dart';

class FavoritesScreenCubit extends Cubit<FavoritesScreenState> {
  UseCase _useCase = DependencyProvider().useCase;

  FavoritesScreenCubit() : super(FavoritesScreenStateInitial());

  getFavorites() {
    _useCase.getFavorites().then((favorites) => emit(FavoritesScreenStateValue(favorites)));
  }

  addProduct(String shopId, String productId) {
    _useCase.addProductToCart(shopId, productId);
  }
}
