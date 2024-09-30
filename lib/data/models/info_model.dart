import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/info_entity.dart';

part 'info_model.freezed.dart';
part 'info_model.g.dart';

@freezed
class InfoModel with _$InfoModel {
  factory InfoModel({
    required int id,
    required String unit,
    required String value,
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  InfoEntity toEntity() {
    return InfoEntity(
      id: id,
      unit: unit,
      value: value,
    );
  }

  factory InfoModel.fromEntity(InfoEntity entity) {
    return InfoModel(
      id: entity.id,
      unit: entity.unit,
      value: entity.value,
    );
  }
}
