import 'package:convenience_marketplace/app/screens/products/details/product_details_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String route = "ProductDetailsScreen";
  static const String keyShopId = "shopId";
  static const String keyProductId = "productId";

  @override
  Widget build(BuildContext context) {
    ScreenArguments<Map<String, String>> arguments = ModalRoute.of(context).settings.arguments;
    String shopId = arguments.value[keyShopId] ?? "";
    String productId = arguments.value[keyProductId] ?? "";

    return Scaffold(
      appBar: AppBar(title: Text("Product")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: Text("Add to cart"),
        icon: Icon(Icons.add_shopping_cart),
      ),
      body: BlocProvider(
        create: (context) => ProductDetailsScreenCubit()..getProduct(shopId, productId),
        child: BlocBuilder<ProductDetailsScreenCubit, ProductDetailsScreenState>(
          builder: (context, state) => state.value == null
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    headerImage(),
                    shopBody(state.value),
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

  Widget shopBody(ProductEntity state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.label,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(state.price.toString() ?? "none"),
            Text(state.units ?? ""),
          ],
        ),
      );
}
