import 'package:convenience_marketplace/app/widgets/rating_bar/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopsListItemWidget extends StatelessWidget {
  static int _ratingPrecision = 1;
  String imageUri;
  String label;
  double rating;
  String category;

  ShopsListItemWidget(this.label, this.category, {this.imageUri = "", this.rating = 0});

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
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/default-shop.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    label,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(category),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          rating.toStringAsFixed(
                            _ratingPrecision,
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      RatingBar(rating)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
