class ProductEntity {
  String id;
  String label;
  String description;
  String manufacturerUuid;
  String manufacturerName;
  double rating;
  double price;
  String units;
  int category;

  ProductEntity(
    this.id,
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
