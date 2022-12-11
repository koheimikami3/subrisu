// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'deleted_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeletedUserData _$DeletedUserDataFromJson(Map<String, dynamic> json) {
  return _DeletedUserData.fromJson(json);
}

/// @nodoc
mixin _$DeletedUserData {
  String get userId => throw _privateConstructorUsedError;
  String get os => throw _privateConstructorUsedError;
  @CreatedAtField()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeletedUserDataCopyWith<DeletedUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletedUserDataCopyWith<$Res> {
  factory $DeletedUserDataCopyWith(
          DeletedUserData value, $Res Function(DeletedUserData) then) =
      _$DeletedUserDataCopyWithImpl<$Res, DeletedUserData>;
  @useResult
  $Res call({String userId, String os, @CreatedAtField() DateTime? deletedAt});
}

/// @nodoc
class _$DeletedUserDataCopyWithImpl<$Res, $Val extends DeletedUserData>
    implements $DeletedUserDataCopyWith<$Res> {
  _$DeletedUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? os = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeletedUserDataCopyWith<$Res>
    implements $DeletedUserDataCopyWith<$Res> {
  factory _$$_DeletedUserDataCopyWith(
          _$_DeletedUserData value, $Res Function(_$_DeletedUserData) then) =
      __$$_DeletedUserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String os, @CreatedAtField() DateTime? deletedAt});
}

/// @nodoc
class __$$_DeletedUserDataCopyWithImpl<$Res>
    extends _$DeletedUserDataCopyWithImpl<$Res, _$_DeletedUserData>
    implements _$$_DeletedUserDataCopyWith<$Res> {
  __$$_DeletedUserDataCopyWithImpl(
      _$_DeletedUserData _value, $Res Function(_$_DeletedUserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? os = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$_DeletedUserData(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeletedUserData extends _DeletedUserData {
  const _$_DeletedUserData(
      {required this.userId,
      required this.os,
      @CreatedAtField() this.deletedAt})
      : super._();

  factory _$_DeletedUserData.fromJson(Map<String, dynamic> json) =>
      _$$_DeletedUserDataFromJson(json);

  @override
  final String userId;
  @override
  final String os;
  @override
  @CreatedAtField()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'DeletedUserData(userId: $userId, os: $os, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeletedUserData &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, os, deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeletedUserDataCopyWith<_$_DeletedUserData> get copyWith =>
      __$$_DeletedUserDataCopyWithImpl<_$_DeletedUserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeletedUserDataToJson(
      this,
    );
  }
}

abstract class _DeletedUserData extends DeletedUserData {
  const factory _DeletedUserData(
      {required final String userId,
      required final String os,
      @CreatedAtField() final DateTime? deletedAt}) = _$_DeletedUserData;
  const _DeletedUserData._() : super._();

  factory _DeletedUserData.fromJson(Map<String, dynamic> json) =
      _$_DeletedUserData.fromJson;

  @override
  String get userId;
  @override
  String get os;
  @override
  @CreatedAtField()
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DeletedUserDataCopyWith<_$_DeletedUserData> get copyWith =>
      throw _privateConstructorUsedError;
}
