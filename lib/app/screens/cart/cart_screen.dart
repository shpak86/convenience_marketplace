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
      return Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ));
    } else {
      if (state.items.isEmpty) {
        return _emptyCartContainer(context);
      } else {
        return Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Container(child: _cartContentContainer(context, state))),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0, right:16.0),
                    child: _cartTotalContainer(context, state),
                  ),
                ],
              ),
            ],
          )
        ]);
      }
    }
  }

  Widget _emptyCartContainer(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.green,
            size: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your cart is empty",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          )
        ],
      ),
    );
  }

  Widget _cartContentContainer(BuildContext context, CartScreenState state) {
    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        var item = state.items[index];
        return CartListItemWidget(
          item,
          onAddItem: () {
            context.read<CartScreenCubit>().addProduct(item.shop.id, item.product.id);
          },
          onRemoveItem: () {
            context.read<CartScreenCubit>().removeProduct(item.shop.id, item.product.id);
          },
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDetailsScreen.route,
              arguments: ScreenArguments<Map<String, String>>({
                ProductDetailsScreen.keyShopId: item.shop.id,
                ProductDetailsScreen.keyProductId: item.product.id,
                ProductDetailsScreen.keyDisplayCartButton: "false"
              }),
            );
          },
          onTrashTap: () {
            context.read<CartScreenCubit>().removeProduct(item.shop.id, item.product.id, quantity: 9999);
          },
        );
      },
    );
  }

  Widget _cartTotalContainer(BuildContext context, CartScreenState state) {
    double total = state.items.map((element) => element.product.price * element.count).reduce((value, element) => value + element);
    return FloatingActionButton.extended(
      onPressed: () {},
      label: Text(
        "Total: \$${total.toStringAsFixed(2)}",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      backgroundColor: Colors.green,

    );

  }
}
