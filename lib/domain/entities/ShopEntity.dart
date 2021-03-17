class ShopEntity {
  String uuid;
  String name;
  String address;
  String description;
  Uri logoUri;
  List<String> contacts;
  String time;
  String category;

  ShopEntity(this.uuid, this.name, this.address, this.category, this.time, {this.description, this.logoUri, this.contacts});
}