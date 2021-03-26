import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:convenience_marketplace/domain/entities/shop_entity.dart';
import 'package:equatable/equatable.dart';

class ShopProductEntity extends Equatable {
  ShopEntity shop;
  ProductEntity product;
  int count;

  ShopProductEntity(this.shop, this.product, this.count);

  @override
  List<Object> get props => [
        shop,
        product
      ];
}
