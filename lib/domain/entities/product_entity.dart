import 'info_entity.dart';

class ProductEntity {
  final int id;
  final String name;
  final double price;
  final String currency;
  final String image;
  final String description;
  final int quantity;
  final List<InfoEntity> infoList;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.image,
    required this.description,
    this.quantity = 0,
    required this.infoList,
  });
}
