import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product_entity.dart';
import 'info_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@unfreezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required final int id,
    required final String name,
    required final double price,
    required final String currency,
    required final String image,
    required final String description,
    required final List<InfoModel> infoList,
    @Default(0) int quantity,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

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

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      currency: entity.currency,
      image: entity.image,
      description: entity.description,
      quantity: entity.quantity,
      infoList:
          entity.infoList.map((info) => InfoModel.fromEntity(info)).toList(),
    );
  }
}
