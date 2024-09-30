import '../../domain/entities/info_entity.dart';

class InfoUiModel {
  final int id;
  final String unit;
  final String value;

  const InfoUiModel({
    required this.id,
    required this.unit,
    required this.value,
  });

  InfoEntity toEntity() {
    return InfoEntity(
      id: id,
      unit: unit,
      value: value,
    );
  }

  factory InfoUiModel.fromEntity(InfoEntity entity) {
    return InfoUiModel(
      id: entity.id,
      unit: entity.unit,
      value: entity.value,
    );
  }
}
