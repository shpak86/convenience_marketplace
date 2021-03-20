class ShopEntity {
  String id;
  String name;
  String description;
  String address;
  String imageUri;
  List<String> contacts;
  String time;
  String category;
  double rating;

  ShopEntity(this.id, this.name, this.description, this.address, this.category, {this.time, this.imageUri = "", this.contacts, this.rating = 0});
}
