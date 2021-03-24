import 'package:bloc/bloc.dart';
import 'package:convenience_marketplace/app/widgets/cart/cart_list_item_widget.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {

  UseCase _useCase = DependencyProvider().useCase;

  SearchScreenCubit() : super(SearchScreenStateInitial());

  findProducts(String namePattern) {
    emit(SearchScreenStateProgress());
    _useCase.findProducts(namePattern: namePattern).then((value) => emit(SearchScreenStateValue(value)));
  }


  addProduct(String shopId, String productId) {
    _useCase.addProductToCart(shopId, productId);
  }
}
