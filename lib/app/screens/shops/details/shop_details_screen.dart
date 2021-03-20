import 'package:convenience_marketplace/app/screens/products/list/products_list_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/details/shop_details_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/rating_bar/rating_bar.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopDetailsScreen extends StatelessWidget {
  static final String route = "ShopDetailsScreen";
  static final String heroTag = "shops_list_to_details_tag";

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
          builder: (context, state) => mainContainer(context, state.value),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context, ShopEntity shop) {
    if (shop == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView(
        children: [
          headerImage(context, shop),
          shopBody(context, shop)
        ],
      );
    }
  }

  Widget headerImage(BuildContext context, ShopEntity shop) => Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0), bottomRight: Radius.circular(24.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(shop.imageUri.isEmpty ? 'assets/images/default-shop.png' : shop.imageUri),
          ),
        ),
      );

  Widget shopBody(BuildContext context, ShopEntity shop) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shopName(context, shop),
            ratingBar(context, shop),
            categoryLabel(context, shop),
            shopLocation(context, shop),
            shopDescription(context, shop),
          ],
        ),
      );

  Widget shopName(BuildContext context, ShopEntity shop) => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                shop.name,
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

  Widget ratingBar(BuildContext context, ShopEntity shop) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RatingBar(shop.rating),
          ),
          Text(
            shop.rating.toStringAsFixed(1),
            style: TextStyle(fontSize: 16),
          )
        ],
      );

  Widget categoryLabel(BuildContext context, ShopEntity shop) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.business,
                color: Colors.grey,
              ),
            ),
            Text(shop.category ?? "")
          ],
        ),
      );

  Widget shopLocation(BuildContext context, ShopEntity shop) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.location_pin,
                color: Colors.grey,
              ),
            ),
            Text(shop.address ?? "")
          ],
        ),
      );

  Widget shopDescription(BuildContext context, ShopEntity shop) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(shop.description ?? ""),
      );
}
