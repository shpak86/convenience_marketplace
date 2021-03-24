import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';

class CartListItemWidget extends StatelessWidget {
  CartItemEntity _cartItemEntity;
  Function _onAddItem;
  Function _onRemoveItem;
  Function _onTap;

  CartListItemWidget(this._cartItemEntity, {Function onAddItem, Function onRemoveItem, Function onTap}) {
    this._onAddItem = onAddItem ?? () {};
    this._onRemoveItem = onRemoveItem ?? () {};
    this._onTap = onTap ?? () {};
  }

  @override
  Widget build(BuildContext context) {
    return mainContainer(context);
  }

  Widget mainContainer(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imageContainer(),
          Expanded(child: bodyContainer(context)),
        ],
      ),
      onTap: _onTap,
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          productNameContainer(context, product),
          shopInfoGroup(context, shop),
          counterContainer(context),
        ],
      ),
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

  counterContainer(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              splashColor: Colors.red,
              iconSize: 20,
              icon: Icon(
                Icons.exposure_minus_1,
              ),
              onPressed: _onRemoveItem),
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue),
            child: RichText(
              text: TextSpan(
                text: "\$" + (_cartItemEntity.product.price * _cartItemEntity.count).toStringAsFixed(2).toString(),
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                children: <TextSpan>[
                  TextSpan(text: " / ", style: TextStyle(fontWeight: FontWeight.normal)),
                  TextSpan(text: _cartItemEntity.count.toString(), style: TextStyle(fontWeight: FontWeight.normal))
                ],
              ),
            ),
          ),
          IconButton(
              splashColor: Colors.green,
              iconSize: 20,
              icon: Icon(
                Icons.plus_one,
              ),
              onPressed: _onAddItem),
        ],
      ),
    );
  }
}
