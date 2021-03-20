class ShopEntity {
  String id;
  String name;
  String description;
  String address;
  String logoUri;
  List<String> contacts;
  String time;
  String category;
  double rating;

  ShopEntity(this.id, this.name, this.description, this.address, this.category, {this.time, this.logoUri = "", this.contacts, this.rating = 0});
}
