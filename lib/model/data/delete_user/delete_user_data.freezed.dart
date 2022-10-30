// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delete_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeleteUserData _$DeleteUserDataFromJson(Map<String, dynamic> json) {
  return _DeleteUserData.fromJson(json);
}

/// @nodoc
mixin _$DeleteUserData {
  String get userId => throw _privateConstructorUsedError;
  String get os => throw _privateConstructorUsedError;
  @CreatedAtField()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteUserDataCopyWith<DeleteUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserDataCopyWith<$Res> {
  factory $DeleteUserDataCopyWith(
          DeleteUserData value, $Res Function(DeleteUserData) then) =
      _$DeleteUserDataCopyWithImpl<$Res, DeleteUserData>;
  @useResult
  $Res call({String userId, String os, @CreatedAtField() DateTime? deletedAt});
}

/// @nodoc
class _$DeleteUserDataCopyWithImpl<$Res, $Val extends DeleteUserData>
    implements $DeleteUserDataCopyWith<$Res> {
  _$DeleteUserDataCopyWithImpl(this._value, this._then);

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
abstract class _$$_DeleteUserDataCopyWith<$Res>
    implements $DeleteUserDataCopyWith<$Res> {
  factory _$$_DeleteUserDataCopyWith(
          _$_DeleteUserData value, $Res Function(_$_DeleteUserData) then) =
      __$$_DeleteUserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String os, @CreatedAtField() DateTime? deletedAt});
}

/// @nodoc
class __$$_DeleteUserDataCopyWithImpl<$Res>
    extends _$DeleteUserDataCopyWithImpl<$Res, _$_DeleteUserData>
    implements _$$_DeleteUserDataCopyWith<$Res> {
  __$$_DeleteUserDataCopyWithImpl(
      _$_DeleteUserData _value, $Res Function(_$_DeleteUserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? os = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$_DeleteUserData(
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
class _$_DeleteUserData extends _DeleteUserData {
  const _$_DeleteUserData(
      {required this.userId,
      required this.os,
      @CreatedAtField() this.deletedAt})
      : super._();

  factory _$_DeleteUserData.fromJson(Map<String, dynamic> json) =>
      _$$_DeleteUserDataFromJson(json);

  @override
  final String userId;
  @override
  final String os;
  @override
  @CreatedAtField()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'DeleteUserData(userId: $userId, os: $os, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteUserData &&
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
  _$$_DeleteUserDataCopyWith<_$_DeleteUserData> get copyWith =>
      __$$_DeleteUserDataCopyWithImpl<_$_DeleteUserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeleteUserDataToJson(
      this,
    );
  }
}

abstract class _DeleteUserData extends DeleteUserData {
  const factory _DeleteUserData(
      {required final String userId,
      required final String os,
      @CreatedAtField() final DateTime? deletedAt}) = _$_DeleteUserData;
  const _DeleteUserData._() : super._();

  factory _DeleteUserData.fromJson(Map<String, dynamic> json) =
      _$_DeleteUserData.fromJson;

  @override
  String get userId;
  @override
  String get os;
  @override
  @CreatedAtField()
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteUserDataCopyWith<_$_DeleteUserData> get copyWith =>
      throw _privateConstructorUsedError;
}
