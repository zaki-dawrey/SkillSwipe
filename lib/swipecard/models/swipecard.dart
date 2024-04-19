// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'swipecard.freezed.dart';
part 'swipecard.g.dart';

@freezed
class Swipecard with _$Swipecard {
  const factory Swipecard({
    @JsonKey(name: 'card_id') required int cardId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'skill_name') required String skillName,
    @JsonKey(name: 'interested_skill_name') required String interestedSkillName,
    @JsonKey(name: 'skill_id') required int skillId,
    @JsonKey(name: 'interested_skill_id') required int interestedSkillId,
  }) = _Swipecard;

  factory Swipecard.fromJson(Map<String, Object?> json) =>
      _$SwipecardFromJson(json);
}
