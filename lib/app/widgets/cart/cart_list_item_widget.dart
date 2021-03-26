import 'dart:ui';

import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartListItemWidget extends StatelessWidget {
  ShopProductEntity _cartItemEntity;
  Function _onAddItem;
  Function _onRemoveItem;
  Function _onTap;
  Function _onTrashTap;

  CartListItemWidget(
    this._cartItemEntity, {
    Function onAddItem,
    Function onRemoveItem,
    Function onTap,
    Function onTrashTap,
  }) {
    this._onAddItem = onAddItem ?? () {};
    this._onRemoveItem = onRemoveItem ?? () {};
    this._onTap = onTap ?? () {};
    this._onTrashTap = onTrashTap ?? () {};
  }

  @override
  Widget build(BuildContext context) {
    return _mainContainer(context);
  }

  Widget _mainContainer(BuildContext context) {
    return InkWell(
      splashColor: Colors.green,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _imageContainer(),
          Expanded(child: _bodyContainer(context)),
        ],
      ),
      onTap: _onTap,
    );
  }

  Widget _imageContainer() => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Image.asset(
          _cartItemEntity.product.imageUri.isEmpty ? 'assets/images/product-default.png' : _cartItemEntity.product.imageUri,
          width: 110,
          height: 110,
        ),
      );

  _bodyContainer(context) {
    var shop = _cartItemEntity.shop;
    var product = _cartItemEntity.product;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _productNameContainer(context, product),
          _shopInfoGroup(context, shop),
          Row(
            children: [
              _controlsGroup(context),
              Spacer(),
              _priceContainer(context),
            ],
          ),
        ],
      ),
    );
  }

  _productNameContainer(context, product) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          product.name,
          style: Theme.of(context).textTheme.subtitle1,
          maxLines: 1,
        ),
      );

  _shopInfoGroup(context, shop) => Padding(
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

  _controlsGroup(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisSize: MainAxisSize.min,
        children: [
          _trashButton(),
          _minusButton(),
          _counterLabel(),
          _plusButton(),
        ],
      ),
    );
  }

  _trashButton() => IconButton(
      splashColor: Colors.red,
      iconSize: 20,
      icon: Icon(
        Icons.delete_forever_outlined,
        color: Colors.red,
      ),
      onPressed: _onTrashTap);

  _minusButton() => IconButton(
      splashColor: Colors.grey,
      iconSize: 20,
      icon: Icon(
        Icons.exposure_minus_1,
        color: Colors.grey,
      ),
      onPressed: _onRemoveItem);

  _plusButton() => IconButton(
      splashColor: Colors.green,
      iconSize: 20,
      icon: Icon(
        Icons.plus_one,
      ),
      onPressed: _onAddItem);

  _counterLabel() => Container(
        constraints: BoxConstraints(minWidth: 50),
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.green),
        ),
        child: Text(
          _cartItemEntity.count.toString(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      );

  _priceContainer(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 16.0),
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.green),
          child: Text(
            "\$" + (_cartItemEntity.product.price * _cartItemEntity.count).toStringAsFixed(2).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}
