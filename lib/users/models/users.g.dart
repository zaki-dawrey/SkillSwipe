// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersImpl _$$UsersImplFromJson(Map<String, dynamic> json) => _$UsersImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      description: json['desc'] as String,
      skillId: json['skill_id'] as int,
      profilePicture: json['profile_picture'] as String,
      interestedId: json['interested_id'] as int,
    );

Map<String, dynamic> _$$UsersImplToJson(_$UsersImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'desc': instance.description,
      'skill_id': instance.skillId,
      'profile_picture': instance.profilePicture,
      'interested_id': instance.interestedId,
    };
