import 'package:convenience_marketplace/domain/entities/cart_item_entity.dart';

abstract class SearchRepository {
  Future<List<CartItemEntity>> findProducts({String namePattern});
}