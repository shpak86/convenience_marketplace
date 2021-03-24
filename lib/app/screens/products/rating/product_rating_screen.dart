import 'package:convenience_marketplace/app/screens/products/rating/product_rating_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/rating_selector/rating_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRatingScreen extends StatelessWidget {
  static final String route = "ProductRatingScreen";
  static const String keyShopId = "shop_id";
  static const String keyProductId = "product_id";

  @override
  Widget build(BuildContext context) {
    ScreenArguments<Map<String, String>> arguments = ModalRoute.of(context).settings.arguments;
    String shopId = arguments.value[keyShopId] ?? "";
    String productId = arguments.value[keyProductId] ?? "";

    return Scaffold(
      appBar: AppBar(title: Text("Rate a product")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: Text("Send a rating"),
        icon: Icon(Icons.star_rate_rounded),
      ),
      body: BlocProvider(
        create: (context) => ProductRatingScreenCubit()..getProduct(shopId, productId),
        child: BlocBuilder<ProductRatingScreenCubit, ProductRatingScreenState>(
          builder: (context, state) => mainContainer(context, state),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context, ProductRatingScreenState state) {
    if (state.product == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Center(
        child: ListView(
          children: [
            headerImage(context, state),
            nameContainer(context, state),
            ratingSelectorContainer(context, state),
            commentContainer(context, state),
          ],
        ),
      );
    }
  }

  Widget headerImage(BuildContext context, ProductRatingScreenState state) => Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0), bottomRight: Radius.circular(24.0)),
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(state.product.imageUri.isEmpty ? 'assets/images/product-default.png' : state.product.imageUri),
          ),
        ),
      );

  Widget nameContainer(BuildContext context, ProductRatingScreenState state) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          state.product.name ?? "",
          style: Theme.of(context).textTheme.headline5,
          maxLines: 2,
        ),
      );


  Widget ratingSelectorContainer(BuildContext context, ProductRatingScreenState state) => Padding(
        padding: EdgeInsets.all(8.0),
        child: RatingSelectorWidget(),
      );

  Widget commentContainer(BuildContext context, ProductRatingScreenState state) => Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Leave a comment"),
              maxLines: null,
              controller: TextEditingController(),
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      );
}
