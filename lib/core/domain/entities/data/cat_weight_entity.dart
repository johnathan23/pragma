import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_weight_entity.g.dart';
part 'cat_weight_entity.freezed.dart';

@freezed
sealed class CatWeightEntity with _$CatWeightEntity {
  const factory CatWeightEntity({required String metric}) = _CatWeightEntity;

  factory CatWeightEntity.fromJson(Map<String, dynamic> json) => _$CatWeightEntityFromJson(json);
}
