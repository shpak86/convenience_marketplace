import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductsListItemWidget extends StatelessWidget {
  ProductEntity productEntity;

  ProductsListItemWidget(ProductEntity productEntity) {
    this.productEntity = productEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Text(productEntity.label),
          Text(productEntity.description ?? ""),
          Text(productEntity.price.toString()),
        ],
      ),
    );
  }
}
