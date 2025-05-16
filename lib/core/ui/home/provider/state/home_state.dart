import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({@Default(false) bool isLoading, String? hasError, String? dioError, List<CatEntity>? catList}) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);
}
