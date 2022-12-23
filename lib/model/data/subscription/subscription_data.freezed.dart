// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscription_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubscriptionData _$SubscriptionDataFromJson(Map<String, dynamic> json) {
  return _SubscriptionData.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionData {
  String get serviceName => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get iconImagePath => throw _privateConstructorUsedError;
  int get paymentCycle => throw _privateConstructorUsedError;
  @FirstPaidAtField()
  DateTime? get firstPaidAt => throw _privateConstructorUsedError;
  bool get notification => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  @CreatedAtField()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @UpdatedAtField()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionDataCopyWith<SubscriptionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionDataCopyWith<$Res> {
  factory $SubscriptionDataCopyWith(
          SubscriptionData value, $Res Function(SubscriptionData) then) =
      _$SubscriptionDataCopyWithImpl<$Res, SubscriptionData>;
  @useResult
  $Res call(
      {String serviceName,
      String price,
      String iconImagePath,
      int paymentCycle,
      @FirstPaidAtField() DateTime? firstPaidAt,
      bool notification,
      String memo,
      @CreatedAtField() DateTime? createdAt,
      @UpdatedAtField() DateTime? updatedAt});
}

/// @nodoc
class _$SubscriptionDataCopyWithImpl<$Res, $Val extends SubscriptionData>
    implements $SubscriptionDataCopyWith<$Res> {
  _$SubscriptionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceName = null,
    Object? price = null,
    Object? iconImagePath = null,
    Object? paymentCycle = null,
    Object? firstPaidAt = freezed,
    Object? notification = null,
    Object? memo = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      iconImagePath: null == iconImagePath
          ? _value.iconImagePath
          : iconImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCycle: null == paymentCycle
          ? _value.paymentCycle
          : paymentCycle // ignore: cast_nullable_to_non_nullable
              as int,
      firstPaidAt: freezed == firstPaidAt
          ? _value.firstPaidAt
          : firstPaidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubscriptionDataCopyWith<$Res>
    implements $SubscriptionDataCopyWith<$Res> {
  factory _$$_SubscriptionDataCopyWith(
          _$_SubscriptionData value, $Res Function(_$_SubscriptionData) then) =
      __$$_SubscriptionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String serviceName,
      String price,
      String iconImagePath,
      int paymentCycle,
      @FirstPaidAtField() DateTime? firstPaidAt,
      bool notification,
      String memo,
      @CreatedAtField() DateTime? createdAt,
      @UpdatedAtField() DateTime? updatedAt});
}

/// @nodoc
class __$$_SubscriptionDataCopyWithImpl<$Res>
    extends _$SubscriptionDataCopyWithImpl<$Res, _$_SubscriptionData>
    implements _$$_SubscriptionDataCopyWith<$Res> {
  __$$_SubscriptionDataCopyWithImpl(
      _$_SubscriptionData _value, $Res Function(_$_SubscriptionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceName = null,
    Object? price = null,
    Object? iconImagePath = null,
    Object? paymentCycle = null,
    Object? firstPaidAt = freezed,
    Object? notification = null,
    Object? memo = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_SubscriptionData(
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      iconImagePath: null == iconImagePath
          ? _value.iconImagePath
          : iconImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCycle: null == paymentCycle
          ? _value.paymentCycle
          : paymentCycle // ignore: cast_nullable_to_non_nullable
              as int,
      firstPaidAt: freezed == firstPaidAt
          ? _value.firstPaidAt
          : firstPaidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubscriptionData extends _SubscriptionData {
  const _$_SubscriptionData(
      {required this.serviceName,
      required this.price,
      this.iconImagePath = '',
      required this.paymentCycle,
      @FirstPaidAtField() this.firstPaidAt,
      required this.notification,
      required this.memo,
      @CreatedAtField() this.createdAt,
      @UpdatedAtField() this.updatedAt})
      : super._();

  factory _$_SubscriptionData.fromJson(Map<String, dynamic> json) =>
      _$$_SubscriptionDataFromJson(json);

  @override
  final String serviceName;
  @override
  final String price;
  @override
  @JsonKey()
  final String iconImagePath;
  @override
  final int paymentCycle;
  @override
  @FirstPaidAtField()
  final DateTime? firstPaidAt;
  @override
  final bool notification;
  @override
  final String memo;
  @override
  @CreatedAtField()
  final DateTime? createdAt;
  @override
  @UpdatedAtField()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SubscriptionData(serviceName: $serviceName, price: $price, iconImagePath: $iconImagePath, paymentCycle: $paymentCycle, firstPaidAt: $firstPaidAt, notification: $notification, memo: $memo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubscriptionData &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.iconImagePath, iconImagePath) ||
                other.iconImagePath == iconImagePath) &&
            (identical(other.paymentCycle, paymentCycle) ||
                other.paymentCycle == paymentCycle) &&
            (identical(other.firstPaidAt, firstPaidAt) ||
                other.firstPaidAt == firstPaidAt) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      serviceName,
      price,
      iconImagePath,
      paymentCycle,
      firstPaidAt,
      notification,
      memo,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubscriptionDataCopyWith<_$_SubscriptionData> get copyWith =>
      __$$_SubscriptionDataCopyWithImpl<_$_SubscriptionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriptionDataToJson(
      this,
    );
  }
}

abstract class _SubscriptionData extends SubscriptionData {
  const factory _SubscriptionData(
      {required final String serviceName,
      required final String price,
      final String iconImagePath,
      required final int paymentCycle,
      @FirstPaidAtField() final DateTime? firstPaidAt,
      required final bool notification,
      required final String memo,
      @CreatedAtField() final DateTime? createdAt,
      @UpdatedAtField() final DateTime? updatedAt}) = _$_SubscriptionData;
  const _SubscriptionData._() : super._();

  factory _SubscriptionData.fromJson(Map<String, dynamic> json) =
      _$_SubscriptionData.fromJson;

  @override
  String get serviceName;
  @override
  String get price;
  @override
  String get iconImagePath;
  @override
  int get paymentCycle;
  @override
  @FirstPaidAtField()
  DateTime? get firstPaidAt;
  @override
  bool get notification;
  @override
  String get memo;
  @override
  @CreatedAtField()
  DateTime? get createdAt;
  @override
  @UpdatedAtField()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionDataCopyWith<_$_SubscriptionData> get copyWith =>
      throw _privateConstructorUsedError;
}
