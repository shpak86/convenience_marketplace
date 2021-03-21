import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'shop_rating_screen_state.dart';

class ShopRatingScreenCubit extends Cubit<ShopRatingScreenState> {
  ShopRatingScreenCubit() : super(ShopRatingScreenInitial());

  UseCase _useCase = DependencyProvider().useCase;

  getShop(String id) {
    _useCase.getShop(id).then((value) => emit(ShopRatingScreenValue(value)));
  }
}
