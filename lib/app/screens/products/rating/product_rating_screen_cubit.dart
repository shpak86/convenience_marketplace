import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'product_rating_screen_state.dart';

class ProductRatingScreenCubit extends Cubit<ProductRatingScreenState> {
  ProductRatingScreenCubit() : super(ProductRatingScreenInitial());

  UseCase _useCase = DependencyProvider().useCase;

  getProduct(String shopId, String productId) {
    _useCase.getProduct(shopId, productId).then((value) => emit(ProductRatingScreenValue(value)));
  }
}
