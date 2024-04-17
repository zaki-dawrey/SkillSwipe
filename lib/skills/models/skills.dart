// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'skills.freezed.dart';
part 'skills.g.dart';

@freezed
class Skills with _$Skills {
  const factory Skills({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'photo_id') required String photoId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Skills;

  factory Skills.fromJson(Map<String, Object?> json) => _$SkillsFromJson(json);
}
