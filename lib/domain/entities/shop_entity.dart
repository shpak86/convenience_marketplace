class ShopEntity {
  String id;
  String name;
  String address;
  String description;
  String logoUri;
  List<String> contacts;
  String time;
  String category;
  double rating;

  ShopEntity(this.id, this.name, this.address, this.category, this.time, {this.description, this.logoUri = "", this.contacts, this.rating = 0});
}
