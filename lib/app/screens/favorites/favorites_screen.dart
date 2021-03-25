import 'package:convenience_marketplace/app/screens/favorites/favorites_screen_cubit.dart';
import 'package:convenience_marketplace/app/screens/products/details/product_details_screen.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/search/search_results_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesScreenCubit()..getFavorites(),
      child: BlocBuilder<FavoritesScreenCubit, FavoritesScreenState>(
        builder: (context, state) => _mainContainer(context, state),
      ),
    );
  }

  Widget _mainContainer(BuildContext context, FavoritesScreenState state) {
    if (state.favorites == null) {
      return _progressContainer();
    } else {
      return SafeArea(
        child: _favoritesListContainer(context, state),
      );
    }
  }

  Widget _progressContainer() => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
      ));

  Widget _favoritesListContainer(BuildContext context, FavoritesScreenState state) {
    return ListView(
      children: state.favorites
          .map(
            (item) => SearchResultsListItemWidget(
              item,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductDetailsScreen.route,
                  arguments: ScreenArguments<Map<String, String>>({
                    ProductDetailsScreen.keyShopId: item.shop.id,
                    ProductDetailsScreen.keyProductId: item.product.id
                  }),
                ).then((value) => context.read<FavoritesScreenCubit>().getFavorites());
              },
              onCartButtonTap: () {
                context.read<FavoritesScreenCubit>().addProduct(item.shop.id, item.product.id);
              },
            ),
          )
          .toList(),
    );
  }
}
