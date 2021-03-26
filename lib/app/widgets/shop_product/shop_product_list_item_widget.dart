import 'package:convenience_marketplace/app/widgets/cart/cart_button_widget.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';
import 'package:flutter/material.dart';

class ShopProductListItemWidget extends StatelessWidget {
  ShopProductEntity _cartItemEntity;
  Function _onCartButtonTap;
  Function _onTap;
  Color _splashColor;

  ShopProductListItemWidget(this._cartItemEntity, {Function onCartButtonTap, Function onTap, Color splashColor }) {
    _onCartButtonTap = onCartButtonTap ?? () {};
    _onTap = onTap ?? () {};
    _splashColor = splashColor ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return mainContainer(context);
  }

  Widget mainContainer(BuildContext context) {
    return InkWell(
      splashColor: _splashColor,
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

  bodyContainer(BuildContext context) {
    var shop = _cartItemEntity.shop;
    var product = _cartItemEntity.product;
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          productNameContainer(context, product),
          shopInfoGroup(context, shop),
          controlsContainer(context, product),
          // priceContainer(context)
        ],
      ),
    );
  }

  controlsContainer(BuildContext context, ProductEntity product) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CartButtonWidget(
            product.price.toStringAsFixed(2),
            product.units,
            onTap: _onCartButtonTap,
          ),
        ],
      );

  productNameContainer(BuildContext context, ProductEntity product) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          product.name,
          style: Theme.of(context).textTheme.subtitle1,
          maxLines: 1,
        ),
      );

  shopInfoGroup(BuildContext context, ShopEntity shop) => Padding(
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
