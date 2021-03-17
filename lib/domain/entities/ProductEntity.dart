class ProductEntity {
  String uuid;
  String label;
  String description;
  double rating;
  String manufacturerUuid;
  String manufacturerName;
  double price;
  String units;
  int category;

  ProductEntity(
    this.uuid,
    this.label,
    this.price,
    this.units, {
    this.description,
    this.category,
    this.rating,
    this.manufacturerUuid,
    this.manufacturerName,
  });
}
