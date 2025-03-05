// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_creation_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserCreationData _$UserCreationDataFromJson(Map<String, dynamic> json) {
  return _UserCreationData.fromJson(json);
}

/// @nodoc
mixin _$UserCreationData {
// 端末のOS
  String get os => throw _privateConstructorUsedError; // FCMトークン
  String get token => throw _privateConstructorUsedError; // 作成日時
  @CreatedAtField()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserCreationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCreationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCreationDataCopyWith<UserCreationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCreationDataCopyWith<$Res> {
  factory $UserCreationDataCopyWith(
          UserCreationData value, $Res Function(UserCreationData) then) =
      _$UserCreationDataCopyWithImpl<$Res, UserCreationData>;
  @useResult
  $Res call({String os, String token, @CreatedAtField() DateTime? createdAt});
}

/// @nodoc
class _$UserCreationDataCopyWithImpl<$Res, $Val extends UserCreationData>
    implements $UserCreationDataCopyWith<$Res> {
  _$UserCreationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCreationData
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
abstract class _$$UserCreationDataImplCopyWith<$Res>
    implements $UserCreationDataCopyWith<$Res> {
  factory _$$UserCreationDataImplCopyWith(_$UserCreationDataImpl value,
          $Res Function(_$UserCreationDataImpl) then) =
      __$$UserCreationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String os, String token, @CreatedAtField() DateTime? createdAt});
}

/// @nodoc
class __$$UserCreationDataImplCopyWithImpl<$Res>
    extends _$UserCreationDataCopyWithImpl<$Res, _$UserCreationDataImpl>
    implements _$$UserCreationDataImplCopyWith<$Res> {
  __$$UserCreationDataImplCopyWithImpl(_$UserCreationDataImpl _value,
      $Res Function(_$UserCreationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCreationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? os = null,
    Object? token = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserCreationDataImpl(
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
class _$UserCreationDataImpl extends _UserCreationData {
  const _$UserCreationDataImpl(
      {required this.os, required this.token, @CreatedAtField() this.createdAt})
      : super._();

  factory _$UserCreationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCreationDataImplFromJson(json);

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
    return 'UserCreationData(os: $os, token: $token, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCreationDataImpl &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, os, token, createdAt);

  /// Create a copy of UserCreationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCreationDataImplCopyWith<_$UserCreationDataImpl> get copyWith =>
      __$$UserCreationDataImplCopyWithImpl<_$UserCreationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCreationDataImplToJson(
      this,
    );
  }
}

abstract class _UserCreationData extends UserCreationData {
  const factory _UserCreationData(
      {required final String os,
      required final String token,
      @CreatedAtField() final DateTime? createdAt}) = _$UserCreationDataImpl;
  const _UserCreationData._() : super._();

  factory _UserCreationData.fromJson(Map<String, dynamic> json) =
      _$UserCreationDataImpl.fromJson;

// 端末のOS
  @override
  String get os; // FCMトークン
  @override
  String get token; // 作成日時
  @override
  @CreatedAtField()
  DateTime? get createdAt;

  /// Create a copy of UserCreationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCreationDataImplCopyWith<_$UserCreationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
