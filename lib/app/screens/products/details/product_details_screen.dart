import 'package:convenience_marketplace/app/screens/products/details/product_details_screen_cubit.dart';
import 'package:convenience_marketplace/app/screens/products/rating/product_rating_screen.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/rating_bar/rating_bar.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String route = "ProductDetailsScreen";
  static const String keyShopId = "shop_id";
  static const String keyProductId = "product_id";

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
          builder: (context, state) => mainContainer(context, state),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context, ProductDetailsScreenState state) {
    if (state.product == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView(
        children: [
          headerImageContainer(context, state.product),
          bodyGroup(context, state),
        ],
      );
    }
  }

  Widget headerImageContainer(BuildContext context, ProductEntity product) => Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0), bottomRight: Radius.circular(24.0)),
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(product.imageUri.isEmpty ? 'assets/images/product-default.png' : product.imageUri),
          ),
        ),
      );

  Widget bodyGroup(BuildContext context, ProductDetailsScreenState state) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productNameGroup(context, state),
            ratingContainer(context, state),
            priceContainer(context, state.product),
            descriptionContainer(context, state.product),
          ],
        ),
      );

  Widget productNameGroup(BuildContext context, ProductDetailsScreenState state) => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          children: [
            productNameContainer(context, state.product),
            favoriteButtonContainer(context, state.product, state.shopId),
          ],
        ),
      );

  Widget productNameContainer(BuildContext context, ProductEntity product) => Expanded(
        child: Text(
          product.name,
          style: TextStyle(fontSize: 20.0),
        ),
      );

  Widget favoriteButtonContainer(BuildContext context, ProductEntity product, String shopId) => IconButton(
        icon: Icon(
          Icons.favorite,
          color: product.favorite ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          context.read<ProductDetailsScreenCubit>().switchFavorite(shopId, product.id);
        },
      );

  Widget ratingContainer(BuildContext context, ProductDetailsScreenState state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            child: Row(
              children: [
                RatingBar(state.product.rating),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    state.product.rating.toStringAsFixed(1),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductRatingScreen.route,
                arguments: ScreenArguments<Map<String, String>>({
                  ProductRatingScreen.keyShopId: state.shopId,
                  ProductRatingScreen.keyProductId: state.product.id
                }),
              );
            }),
      );

  Widget priceContainer(BuildContext context, ProductEntity product) => Padding(
        padding: EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            text: "\$" + product.price.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: " / ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  )),
              TextSpan(text: product.units, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      );

  Widget descriptionContainer(BuildContext context, ProductEntity product) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(product.description),
      );
}
