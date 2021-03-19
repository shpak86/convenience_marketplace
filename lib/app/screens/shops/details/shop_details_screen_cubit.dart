import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'shop_details_screen_state.dart';

class ShopDetailsScreenCubit extends Cubit<ShopDetailsScreenState> {
  ShopDetailsScreenCubit() : super(ShopDetailsInitial());

  UseCase _useCase = DependencyProvider().useCase;

  getShop(String id) {
    _useCase.getShop(id).then((value) => emit(ShopDetailsValue(value)));
  }
}
