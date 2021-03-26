import 'package:convenience_marketplace/app/screens/products/list/products_list_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/details/shop_details_screen_cubit.dart';
import 'package:convenience_marketplace/app/screens/shops/rating/shop_rating_screen.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/rating_bar/rating_bar_widget.dart';
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
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.pushNamed(context, ProductsListScreen.route, arguments: ScreenArguments<String>(shopId))
        },
        label: Text("Go shopping"),
        icon: Icon(Icons.shopping_cart_outlined),
        backgroundColor: Colors.blue,
      ),
      body: BlocProvider(
        create: (context) => ShopDetailsScreenCubit()..getShop(shopId),
        child: BlocBuilder<ShopDetailsScreenCubit, ShopDetailsScreenState>(
          builder: (context, state) => mainContainer(context, state.shop),
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
          imageContainer(context, shop),
          shopBodyGroup(context, shop)
        ],
      );
    }
  }

  Widget imageContainer(BuildContext context, ShopEntity shop) => Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0), bottomRight: Radius.circular(24.0)),
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(shop.imageUri.isEmpty ? 'assets/images/default-shop.png' : shop.imageUri),
          ),
        ),
      );

  Widget shopBodyGroup(BuildContext context, ShopEntity shop) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shopName(context, shop),
            ratingContainer(context, shop),
            categoryContainer(context, shop),
            locationContainer(context, shop),
            descriptionContainer(context, shop),
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
            favoriteButtonContainer(context, shop),
          ],
        ),
      );

  Widget favoriteButtonContainer(BuildContext context, ShopEntity shop) => IconButton(
        icon: Icon(
          Icons.favorite,
          color: shop.favorite ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          context.read<ShopDetailsScreenCubit>().switchFavorite(shop.id);
        },
      );

  Widget ratingContainer(BuildContext context, ShopEntity shop) => InkWell(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RatingBarWidget(shop.rating),
            ),
            Text(
              shop.rating.toStringAsFixed(1),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, ShopRatingScreen.route, arguments: ScreenArguments<String>(shop.id));
        },
      );

  Widget categoryContainer(BuildContext context, ShopEntity shop) => Padding(
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

  Widget locationContainer(BuildContext context, ShopEntity shop) => Padding(
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

  Widget descriptionContainer(BuildContext context, ShopEntity shop) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(shop.description ?? ""),
      );
}
