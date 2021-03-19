import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/app/screens/shops/details/shop_details_screen.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'shops_list_screen_state.dart';

class ShopsListScreenCubit extends Cubit<ShopsListScreenState> {
  ShopsListScreenCubit() : super(ShopsListScreenStateInitial());

  UseCase _useCase = DependencyProvider().useCase;

  void getShopsList() {
    _useCase.getShopsList().then((value) => emit(ShopsListScreenStateUpdate(value)));
  }

}
