import 'package:convenience_marketplace/app/screens/cart/cart_screen_cubit.dart';
import 'package:convenience_marketplace/app/screens/products/details/product_details_screen.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/cart/cart_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartScreenCubit()..getItems(),
      child: BlocBuilder<CartScreenCubit, CartScreenState>(
        builder: (context, state) => _mainContainer(context, state),
      ),
    );
  }

  Widget _mainContainer(BuildContext context, CartScreenState state) {
    if (state.items == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: state.items.length,
        itemBuilder: (context, index) {
          var item = state.items[index];
          return CartListItemWidget(item, onAddItem: () {
            context.read<CartScreenCubit>().addProduct(item.shop.id, item.product.id);
          }, onRemoveItem: () {
            context.read<CartScreenCubit>().removeProduct(item.shop.id, item.product.id);
          }, onTap: () {
            Navigator.pushNamed(context, ProductDetailsScreen.route,
                arguments: ScreenArguments<Map<String, String>>({
                  ProductDetailsScreen.keyShopId: item.shop.id,
                  ProductDetailsScreen.keyProductId: item.product.id,
                  ProductDetailsScreen.keyDisplayCartButton: "false"
                }));
          });
        },
      );
    }
  }
}
