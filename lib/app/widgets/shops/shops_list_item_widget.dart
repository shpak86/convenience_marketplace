import 'package:convenience_marketplace/app/widgets/rating_bar/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class ShopsListItemWidget extends StatelessWidget {
  static int _ratingPrecision = 1;
  String imageUri;
  String label;
  double rating;
  String category;
  String description;

  ShopsListItemWidget(this.label, this.description, {this.imageUri = "", this.rating = 0, this.category});

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
          imageContainer(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
    );
  }

  Widget ratingGroup(BuildContext context) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: RatingBar(rating),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              rating.toStringAsFixed(
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
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/default-shop.png'),
          ),
        ),
      );

  Widget nameContainer(BuildContext context) => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          label,
          style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline6),
          maxLines: 2,
        ),
      );

  Widget descriptionContainer(BuildContext context) => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          description,
          maxLines: 5,
          style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodyText1),
        ),
      );
}
