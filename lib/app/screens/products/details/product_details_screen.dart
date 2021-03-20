import 'package:convenience_marketplace/app/screens/products/details/product_details_screen_cubit.dart';
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
          builder: (context, state) => mainContainer(context, state.value),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context, ProductEntity product) {
    if (product == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView(
        children: [
          headerImageContainer(context, product),
          bodyGroup(context, product),
        ],
      );
    }
  }

  Widget headerImageContainer(BuildContext context, ProductEntity product) => Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0), bottomRight: Radius.circular(24.0)),
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(product.imageUri.isEmpty ? 'assets/images/product-default.png' : product.imageUri),
          ),
        ),
      );

  Widget bodyGroup(BuildContext context, ProductEntity product) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productNameGroup(context, product),
            ratingBar(context, product),
            productPrice(context, product),
            productDescription(context, product),
          ],
        ),
      );
}

Widget productNameGroup(BuildContext context, ProductEntity product) => Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              product.label,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          favoriteButton(),
        ],
      ),
    );

Widget favoriteButton() => IconButton(
      icon: Icon(
        Icons.favorite,
        color: Colors.grey,
      ),
      onPressed: () {},
    );

Widget ratingBar(BuildContext context, ProductEntity product) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          RatingBar(product.rating),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              product.rating.toStringAsFixed(1),
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );

Widget productPrice(BuildContext context, ProductEntity product) => Padding(
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

Widget productDescription(BuildContext context, ProductEntity product) => Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(product.description),
    );
