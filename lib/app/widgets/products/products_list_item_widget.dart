import 'package:convenience_marketplace/app/widgets/rating_bar/rating_bar.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsListItemWidget extends StatelessWidget {
  ProductEntity _productEntity;
  Function _onCartTap;
  Function _onFavoriteTap;
  Function _onDetailsTap;

  ProductsListItemWidget(ProductEntity productEntity, {Function onCartTap, Function onFavoriteTap, Function onDetailsTap}) {
    _productEntity = productEntity;
    _onCartTap = onCartTap == null ? () {} : onCartTap;
    _onFavoriteTap = onFavoriteTap == null ? () {} : onFavoriteTap;
    _onDetailsTap = onDetailsTap == null ? () {} : onDetailsTap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(color: Colors.black12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: cardBodyGroup(context)),
          cardFooterGroup(context),
        ],
      ),
    );
  }

  Widget cardBodyGroup(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              imageContainer(),
              favoriteButton(),
              ratingContainer(),
            ],
          ),
          productNameContainer(context)
        ],
      ),
      onTap: _onDetailsTap,
    );
  }

  Widget imageContainer() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          // image: AssetImage("assets/images/product-default.png"),
          image: AssetImage(_productEntity.imageUri.isEmpty ? 'assets/images/product-default.png' : _productEntity.imageUri),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white,
      ),
    );
  }

  Widget favoriteButton() {
    return Container(
      padding: EdgeInsets.all(12.0),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.favorite,
            color: _productEntity.favorite ? Colors.red : Colors.grey,
          ),
        ],
      ),
    );
  }

  ratingContainer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RatingBar(
            _productEntity.rating,
            color: Colors.amber,
          )
        ],
      ),
    );
  }

  Widget productNameContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
      child: Text(
        _productEntity.label,
        style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodyText1),
        maxLines: 2,
      ),
    );
  }

  Widget productUnitsLabel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Text(
        _productEntity.units,
        style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.caption),
        maxLines: 1,
      ),
    );
  }

  Widget productDescriptionLabel(BuildContext context) {
    return Text(
      _productEntity.description,
      style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodyText1),
      maxLines: 4,
    );
  }

  Widget productPriceLabel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: RichText(
        text: TextSpan(
          text: "\$" + _productEntity.price.toString(),
          style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          children: <TextSpan>[
            TextSpan(text: " / ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
            TextSpan(text: _productEntity.units, style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.caption).merge(TextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }

  Widget cartButton(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: _onCartTap,
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
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: productPriceLabel(context),
            )
          ],
        ),
      ),
    );
  }

  Widget cardFooterGroup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 12.0, right: 12.0),
      child: Row(
        children: [
          cartButton(context)
        ],
      ),
    );
  }
}
