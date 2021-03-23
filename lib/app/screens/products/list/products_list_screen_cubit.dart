import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'products_list_screen_state.dart';

class ProductsListScreenCubit extends Cubit<ProductsListScreenState> {
  ProductsListScreenCubit() : super(ProductsListScreenStateInitial());

  UseCase _useCase = DependencyProvider().useCase;

  getProducts(String shopId) {
    _useCase.getProductsList(shopId).then((value) => emit(ProductsListScreenStateValue(value)));
  }

  addProduct(String shopId, String productId) {
    _useCase.addProductToCart(shopId, productId);
  }

  addToCart(String shopId, String productId) {
    _useCase.addProductToCart(shopId, productId);
  }
}
