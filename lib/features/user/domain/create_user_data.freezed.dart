// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateUserData _$CreateUserDataFromJson(Map<String, dynamic> json) {
  return _CreateUserData.fromJson(json);
}

/// @nodoc
mixin _$CreateUserData {
// 端末のOS
  String get os => throw _privateConstructorUsedError; // FCMトークン
  String get token => throw _privateConstructorUsedError; // 作成日時
  @CreatedAtField()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CreateUserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserDataCopyWith<CreateUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserDataCopyWith<$Res> {
  factory $CreateUserDataCopyWith(
          CreateUserData value, $Res Function(CreateUserData) then) =
      _$CreateUserDataCopyWithImpl<$Res, CreateUserData>;
  @useResult
  $Res call({String os, String token, @CreatedAtField() DateTime? createdAt});
}

/// @nodoc
class _$CreateUserDataCopyWithImpl<$Res, $Val extends CreateUserData>
    implements $CreateUserDataCopyWith<$Res> {
  _$CreateUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? os = null,
    Object? token = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUserDataImplCopyWith<$Res>
    implements $CreateUserDataCopyWith<$Res> {
  factory _$$CreateUserDataImplCopyWith(_$CreateUserDataImpl value,
          $Res Function(_$CreateUserDataImpl) then) =
      __$$CreateUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String os, String token, @CreatedAtField() DateTime? createdAt});
}

/// @nodoc
class __$$CreateUserDataImplCopyWithImpl<$Res>
    extends _$CreateUserDataCopyWithImpl<$Res, _$CreateUserDataImpl>
    implements _$$CreateUserDataImplCopyWith<$Res> {
  __$$CreateUserDataImplCopyWithImpl(
      _$CreateUserDataImpl _value, $Res Function(_$CreateUserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateUserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? os = null,
    Object? token = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$CreateUserDataImpl(
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserDataImpl extends _CreateUserData {
  const _$CreateUserDataImpl(
      {required this.os, required this.token, @CreatedAtField() this.createdAt})
      : super._();

  factory _$CreateUserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserDataImplFromJson(json);

// 端末のOS
  @override
  final String os;
// FCMトークン
  @override
  final String token;
// 作成日時
  @override
  @CreatedAtField()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CreateUserData(os: $os, token: $token, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserDataImpl &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, os, token, createdAt);

  /// Create a copy of CreateUserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserDataImplCopyWith<_$CreateUserDataImpl> get copyWith =>
      __$$CreateUserDataImplCopyWithImpl<_$CreateUserDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserDataImplToJson(
      this,
    );
  }
}

abstract class _CreateUserData extends CreateUserData {
  const factory _CreateUserData(
      {required final String os,
      required final String token,
      @CreatedAtField() final DateTime? createdAt}) = _$CreateUserDataImpl;
  const _CreateUserData._() : super._();

  factory _CreateUserData.fromJson(Map<String, dynamic> json) =
      _$CreateUserDataImpl.fromJson;

// 端末のOS
  @override
  String get os; // FCMトークン
  @override
  String get token; // 作成日時
  @override
  @CreatedAtField()
  DateTime? get createdAt;

  /// Create a copy of CreateUserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserDataImplCopyWith<_$CreateUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
