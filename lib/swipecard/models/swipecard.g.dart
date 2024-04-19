// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swipecard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SwipecardImpl _$$SwipecardImplFromJson(Map<String, dynamic> json) =>
    _$SwipecardImpl(
      cardId: json['card_id'] as int,
      userId: json['user_id'] as String,
      username: json['username'] as String,
      skillName: json['skill_name'] as String,
      interestedSkillName: json['interested_skill_name'] as String,
      skillId: json['skill_id'] as int,
      interestedSkillId: json['interested_skill_id'] as int,
    );

Map<String, dynamic> _$$SwipecardImplToJson(_$SwipecardImpl instance) =>
    <String, dynamic>{
      'card_id': instance.cardId,
      'user_id': instance.userId,
      'username': instance.username,
      'skill_name': instance.skillName,
      'interested_skill_name': instance.interestedSkillName,
      'skill_id': instance.skillId,
      'interested_skill_id': instance.interestedSkillId,
    };
