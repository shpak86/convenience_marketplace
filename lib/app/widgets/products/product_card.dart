import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ShopProductEntity item;
  Color _color;
  String _imageUri;
  String _label;

  ProductCard(
    this.item, {
    Color color,
  }) {
    _imageUri = item.product.imageUri.isNotEmpty ? item.product.imageUri : "assets/images/product-default.png";
    _label = item.product.name;
    _color = color ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return _mainContainer();
  }

  Widget _mainContainer() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.grey),
              color: _color,
            ),
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  _imageUri,
                )),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _label,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
