// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillsImpl _$$SkillsImplFromJson(Map<String, dynamic> json) => _$SkillsImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      photoId: json['photo_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$SkillsImplToJson(_$SkillsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo_id': instance.photoId,
      'created_at': instance.createdAt.toIso8601String(),
    };
