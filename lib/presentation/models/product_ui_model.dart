import '../../domain/entities/product_entity.dart';
import 'info_ui_model.dart';

class ProductUiModel {
  final int id;
  final String name;
  final double price;
  final String currency;
  final String image;
  final String description;
  final List<InfoUiModel> infoList;
  final int quantity;

  ProductUiModel({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.image,
    required this.description,
    required this.infoList,
    this.quantity = 0,
  });

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      currency: currency,
      image: image,
      description: description,
      quantity: quantity,
      infoList: infoList.map((info) => info.toEntity()).toList(),
    );
  }

  factory ProductUiModel.fromEntity(ProductEntity entity) {
    return ProductUiModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      currency: entity.currency,
      image: entity.image,
      description: entity.description,
      quantity: entity.quantity,
      infoList: entity.infoList.map((info) {
        return InfoUiModel(id: info.id, unit: info.unit, value: info.value);
      }).toList(),
    );
  }
}
