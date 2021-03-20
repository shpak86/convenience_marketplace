class ProductEntity {
  String id;
  String label;
  String description;
  String manufacturerUuid;
  String manufacturerName;
  double rating;
  double price;
  String units;
  String category;
  String imageUri;

  ProductEntity(
    this.id,
    this.label,
    this.description,
    this.price,
    this.units, {
    this.imageUri = "",
    this.category = "None",
    this.rating = 0,
    this.manufacturerUuid = "",
    this.manufacturerName = "Unknown",
  });
}
