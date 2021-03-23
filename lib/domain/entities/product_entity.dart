import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  String id;
  String shopId;
  String shopName;
  String name;
  String description;
  String manufacturerUuid;
  String manufacturerName;
  double rating;
  double price;
  String units;
  String category;
  String imageUri;
  bool favorite;

  ProductEntity(
    this.id,
    this.shopId,
    this.name,
    this.description,
    this.price,
    this.units, {
    this.shopName = "",
    this.imageUri = "",
    this.category = "None",
    this.rating = 0,
    this.manufacturerUuid = "",
    this.manufacturerName = "Unknown",
    this.favorite = false,
  });

  @override
  List<Object> get props => [
        id,
        shopId
      ];
}
