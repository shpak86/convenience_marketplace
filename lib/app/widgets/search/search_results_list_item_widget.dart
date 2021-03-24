import 'package:convenience_marketplace/app/widgets/cart/cart_button_widget.dart';
import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';

class SearchResultsListItemWidget extends StatelessWidget {
  CartItemEntity _cartItemEntity;
  Function _onCartButtonTap;
  Function _onTap;

  SearchResultsListItemWidget(this._cartItemEntity, {Function onCartButtonTap, Function onTap}) {
    _onCartButtonTap = onCartButtonTap ?? () {};
    _onTap = onTap ?? () {};
  }

  @override
  Widget build(BuildContext context) {
    return mainContainer(context);
  }

  Widget mainContainer(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imageContainer(),
          Expanded(child: bodyContainer(context)),
        ],
      ),
    );
  }

  Widget imageContainer() => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Image.asset(
          _cartItemEntity.product.imageUri.isEmpty ? 'assets/images/product-default.png' : _cartItemEntity.product.imageUri,
          width: 110,
          height: 110,
        ),
      );

  bodyContainer(context) {
    var shop = _cartItemEntity.shop;
    var product = _cartItemEntity.product;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        productNameContainer(context, product),
        shopInfoGroup(context, shop),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CartButtonWidget(
              product.price.toStringAsFixed(2),
              product.units,
              onTap: _onCartButtonTap,
            ),
          ],
        ),
        // priceContainer(context)
      ],
    );
  }

  productNameContainer(context, product) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          product.name,
          style: Theme.of(context).textTheme.subtitle1,
          maxLines: 1,
        ),
      );

  shopInfoGroup(context, shop) => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              shop.name,
              maxLines: 1,
            ),
            Text(
              shop.address,
              style: Theme.of(context).textTheme.caption,
              maxLines: 2,
            ),
          ],
        ),
      );
}
