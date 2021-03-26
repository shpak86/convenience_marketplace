import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/app/widgets/cart/cart_list_item_widget.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'catalog_screen_state.dart';

class CatalogScreenCubit extends Cubit<CatalogScreenState> {

  UseCase _useCase = DependencyProvider().useCase;

  CatalogScreenCubit() : super(CatalogScreenStateInitial());

  findProducts(String namePattern) {
    emit(CatalogScreenStateProgress());
    _useCase.findProducts(namePattern: namePattern).then((value) => emit(CatalogScreenStateValue(value)));
  }

  addProduct(String shopId, String productId) {
    _useCase.addToCart(shopId, productId);
  }
}
