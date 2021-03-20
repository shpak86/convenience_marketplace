import 'package:convenience_marketplace/app/screens/products/list/products_list_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/details/shop_details_screen.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/rating_bar/rating_bar.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopsListItemWidget extends StatelessWidget {
  static int _ratingPrecision = 1;
  String _imageUri;
  String _name;
  double _rating;
  String _category;
  String _description;
  Function _onTap;
  ShopEntity _shop;

  ShopsListItemWidget(ShopEntity shop, {Function onTap}) {
    _shop = shop;
    _imageUri = shop.imageUri;
    _name = shop.name;
    _rating = shop.rating;
    _category = shop.category;
    _description = shop.description;
    _onTap = onTap == null ? () {} : onTap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5.0, spreadRadius: 3.0)
        ],
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  imageContainer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                    child: Column(
                      children: [
                        headerGroup(context),
                        ratingGroup(context),
                        descriptionContainer(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: _onTap,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: shoppingButton(context),
          ),
        ],
      ),
    );
  }

  Widget ratingGroup(BuildContext context) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: RatingBar(_rating),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              _rating.toStringAsFixed(
                _ratingPrecision,
              ),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      );

  Widget headerGroup(BuildContext context) => Row(children: [
        Expanded(child: nameContainer(context)),
        favoriteButton(),
      ]);

  Widget favoriteButton() => IconButton(
        icon: Icon(
          Icons.favorite,
          color: Colors.grey,
        ),
      );

  Widget imageContainer() => Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(_imageUri.isEmpty ? 'assets/images/default-shop.png' : _imageUri),
          ),
        ),
      );

  Widget nameContainer(BuildContext context) => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          _name,
          style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline6),
          maxLines: 2,
        ),
      );

  Widget descriptionContainer(BuildContext context) => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          _description,
          maxLines: 5,
          style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodyText1),
        ),
      );

  Widget shoppingButton(BuildContext context) => TextButton(
        onPressed: () => Navigator.pushNamed(context, ProductsListScreen.route, arguments: ScreenArguments<String>(_shop.id)),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.2)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.green),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                "Go shopping",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
}
