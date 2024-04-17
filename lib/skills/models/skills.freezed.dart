// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Skills _$SkillsFromJson(Map<String, dynamic> json) {
  return _Skills.fromJson(json);
}

/// @nodoc
mixin _$Skills {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_id')
  String get photoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkillsCopyWith<Skills> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillsCopyWith<$Res> {
  factory $SkillsCopyWith(Skills value, $Res Function(Skills) then) =
      _$SkillsCopyWithImpl<$Res, Skills>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'photo_id') String photoId,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$SkillsCopyWithImpl<$Res, $Val extends Skills>
    implements $SkillsCopyWith<$Res> {
  _$SkillsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoId: null == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillsImplCopyWith<$Res> implements $SkillsCopyWith<$Res> {
  factory _$$SkillsImplCopyWith(
          _$SkillsImpl value, $Res Function(_$SkillsImpl) then) =
      __$$SkillsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'photo_id') String photoId,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$SkillsImplCopyWithImpl<$Res>
    extends _$SkillsCopyWithImpl<$Res, _$SkillsImpl>
    implements _$$SkillsImplCopyWith<$Res> {
  __$$SkillsImplCopyWithImpl(
      _$SkillsImpl _value, $Res Function(_$SkillsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoId = null,
    Object? createdAt = null,
  }) {
    return _then(_$SkillsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoId: null == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillsImpl implements _Skills {
  const _$SkillsImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'photo_id') required this.photoId,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$SkillsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillsImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'photo_id')
  final String photoId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'Skills(id: $id, name: $name, photoId: $photoId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoId, photoId) || other.photoId == photoId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, photoId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillsImplCopyWith<_$SkillsImpl> get copyWith =>
      __$$SkillsImplCopyWithImpl<_$SkillsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillsImplToJson(
      this,
    );
  }
}

abstract class _Skills implements Skills {
  const factory _Skills(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'photo_id') required final String photoId,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$SkillsImpl;

  factory _Skills.fromJson(Map<String, dynamic> json) = _$SkillsImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'photo_id')
  String get photoId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$SkillsImplCopyWith<_$SkillsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
