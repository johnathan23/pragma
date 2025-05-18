import 'package:freezed_annotation/freezed_annotation.dart';

import 'cat_weight_entity.dart';

part 'cat_entity.freezed.dart';
part 'cat_entity.g.dart';

@freezed
sealed class CatEntity with _$CatEntity {
  const factory CatEntity({
    required CatWeightEntity weight,
    @Default(false) @JsonKey(includeFromJson: false, includeToJson: false) bool? isFavorite,
    String? id,
    String? name,
    String? temperament,
    String? origin,
    String? description,
    @JsonKey(name: 'life_span') required String? lifeSpan,
    required int adaptability,
    @JsonKey(name: 'affection_level') required int affectionLevel,
    @JsonKey(name: 'child_friendly') required int childFriendly,
    @JsonKey(name: 'dog_friendly') required int dogFriendly,
    @JsonKey(name: 'energy_level') required int energyLevel,
    @JsonKey(name: 'health_issues') required int healthIssues,
    required int intelligence,
    @JsonKey(name: 'shedding_level') required int sheddingLevel,
    @JsonKey(name: 'social_needs') required int socialNeeds,
    @JsonKey(name: 'stranger_friendly') required int strangerFriendly,
    @JsonKey(name: 'reference_image_id') required String? referenceImageId,
  }) = _CatEntity;

  factory CatEntity.fromJson(Map<String, dynamic> json) => _$CatEntityFromJson(json);
}
