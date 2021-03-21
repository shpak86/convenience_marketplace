import 'package:convenience_marketplace/app/screens/shops/rating/shop_rating_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/rating_selector/rating_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRatingScreen extends StatelessWidget {
  static final String route = "ShopRatingScreen";

  @override
  Widget build(BuildContext context) {
    ScreenArguments<String> arguments = ModalRoute.of(context).settings.arguments;
    String shopId = arguments.value ?? "";

    return Scaffold(
      appBar: AppBar(title: Text("Rate a shop")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: Text("Send a rating"),
        icon: Icon(Icons.star_rate_rounded),
      ),
      body: BlocProvider(
        create: (context) => ShopRatingScreenCubit()..getShop(shopId),
        child: BlocBuilder<ShopRatingScreenCubit, ShopRatingScreenState>(
          builder: (context, state) => mainContainer(context, state),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context, ShopRatingScreenState state) {
    if (state.shop == null) {
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

  Widget headerImage(BuildContext context, ShopRatingScreenState state) => Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0), bottomRight: Radius.circular(24.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(state.shop.imageUri.isEmpty ? 'assets/images/default-shop.png' : state.shop.imageUri),
          ),
        ),
      );

  Widget nameContainer(BuildContext context, ShopRatingScreenState state) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          state.shop.name ?? "",
          style: Theme.of(context).textTheme.headline5,
          maxLines: 2,
        ),
      );

  Widget addressContainer(BuildContext context, ShopRatingScreenState state) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          state.shop.address ?? "",
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 2,
        ),
      );

  Widget ratingSelectorContainer(BuildContext context, ShopRatingScreenState state) => Padding(
        padding: EdgeInsets.all(8.0),
        child: RatingSelector(),
      );

  Widget commentContainer(BuildContext context, ShopRatingScreenState state) => Padding(
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
