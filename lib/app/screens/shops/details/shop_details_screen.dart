import 'package:convenience_marketplace/app/screens/products/list/products_list_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/details/shop_details_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopDetailsScreen extends StatelessWidget {
  static final String route = "ShopDetailsScreen";

  @override
  Widget build(BuildContext context) {
    ScreenArguments<String> arguments = ModalRoute.of(context).settings.arguments;
    String shopId = arguments.value;

    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.pushNamed(context, ProductsListScreen.route, arguments: ScreenArguments<String>(shopId))
        },
        label: Text("Go shopping"),
        icon: Icon(Icons.shopping_cart_outlined),
      ),
      body: BlocProvider(
        create: (context) => ShopDetailsScreenCubit()..getShop(shopId),
        child: BlocBuilder<ShopDetailsScreenCubit, ShopDetailsScreenState>(
          builder: (context, state) => state.value == null
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    headerImage(),
                    shopBody(state),
                  ],
                ),
        ),
      ),
    );
  }

  Widget headerImage() => Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/default-shop.png'),
          ),
        ),
      );

  Widget shopBody(state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.value.name,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(state.value.category),
            Text(state.value.address ?? ""),
            Text(state.value.description ?? ""),
          ],
        ),
      );
}
