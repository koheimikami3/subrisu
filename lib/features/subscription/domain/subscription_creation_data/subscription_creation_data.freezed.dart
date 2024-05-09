// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_creation_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubscriptionCreationData _$SubscriptionCreationDataFromJson(
    Map<String, dynamic> json) {
  return _SubscriptionCreationData.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionCreationData {
// サービス名
  String get serviceName => throw _privateConstructorUsedError; // 価格
  String get price => throw _privateConstructorUsedError; // アイコン画像パス
  String get iconImagePath => throw _privateConstructorUsedError; // 支払い周期
  int get paymentCycle => throw _privateConstructorUsedError; // 初回支払日
  @FirstPaidOnField()
  DateTime? get firstPaidOn => throw _privateConstructorUsedError; // 通知フラグ
  bool get notification => throw _privateConstructorUsedError; // メモ
  String get memo => throw _privateConstructorUsedError; // 作成日時
  @CreatedAtField()
  DateTime? get createdAt => throw _privateConstructorUsedError; // 更新日時
  @UpdatedAtField()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionCreationDataCopyWith<SubscriptionCreationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCreationDataCopyWith<$Res> {
  factory $SubscriptionCreationDataCopyWith(SubscriptionCreationData value,
          $Res Function(SubscriptionCreationData) then) =
      _$SubscriptionCreationDataCopyWithImpl<$Res, SubscriptionCreationData>;
  @useResult
  $Res call(
      {String serviceName,
      String price,
      String iconImagePath,
      int paymentCycle,
      @FirstPaidOnField() DateTime? firstPaidOn,
      bool notification,
      String memo,
      @CreatedAtField() DateTime? createdAt,
      @UpdatedAtField() DateTime? updatedAt});
}

/// @nodoc
class _$SubscriptionCreationDataCopyWithImpl<$Res,
        $Val extends SubscriptionCreationData>
    implements $SubscriptionCreationDataCopyWith<$Res> {
  _$SubscriptionCreationDataCopyWithImpl(this._value, this._then);

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
    Object? firstPaidOn = freezed,
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
      firstPaidOn: freezed == firstPaidOn
          ? _value.firstPaidOn
          : firstPaidOn // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SubscriptionCreationDataImplCopyWith<$Res>
    implements $SubscriptionCreationDataCopyWith<$Res> {
  factory _$$SubscriptionCreationDataImplCopyWith(
          _$SubscriptionCreationDataImpl value,
          $Res Function(_$SubscriptionCreationDataImpl) then) =
      __$$SubscriptionCreationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String serviceName,
      String price,
      String iconImagePath,
      int paymentCycle,
      @FirstPaidOnField() DateTime? firstPaidOn,
      bool notification,
      String memo,
      @CreatedAtField() DateTime? createdAt,
      @UpdatedAtField() DateTime? updatedAt});
}

/// @nodoc
class __$$SubscriptionCreationDataImplCopyWithImpl<$Res>
    extends _$SubscriptionCreationDataCopyWithImpl<$Res,
        _$SubscriptionCreationDataImpl>
    implements _$$SubscriptionCreationDataImplCopyWith<$Res> {
  __$$SubscriptionCreationDataImplCopyWithImpl(
      _$SubscriptionCreationDataImpl _value,
      $Res Function(_$SubscriptionCreationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceName = null,
    Object? price = null,
    Object? iconImagePath = null,
    Object? paymentCycle = null,
    Object? firstPaidOn = freezed,
    Object? notification = null,
    Object? memo = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SubscriptionCreationDataImpl(
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
      firstPaidOn: freezed == firstPaidOn
          ? _value.firstPaidOn
          : firstPaidOn // ignore: cast_nullable_to_non_nullable
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
class _$SubscriptionCreationDataImpl extends _SubscriptionCreationData {
  const _$SubscriptionCreationDataImpl(
      {required this.serviceName,
      required this.price,
      this.iconImagePath = '',
      required this.paymentCycle,
      @FirstPaidOnField() this.firstPaidOn,
      required this.notification,
      required this.memo,
      @CreatedAtField() this.createdAt,
      @UpdatedAtField() this.updatedAt})
      : super._();

  factory _$SubscriptionCreationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionCreationDataImplFromJson(json);

// サービス名
  @override
  final String serviceName;
// 価格
  @override
  final String price;
// アイコン画像パス
  @override
  @JsonKey()
  final String iconImagePath;
// 支払い周期
  @override
  final int paymentCycle;
// 初回支払日
  @override
  @FirstPaidOnField()
  final DateTime? firstPaidOn;
// 通知フラグ
  @override
  final bool notification;
// メモ
  @override
  final String memo;
// 作成日時
  @override
  @CreatedAtField()
  final DateTime? createdAt;
// 更新日時
  @override
  @UpdatedAtField()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SubscriptionCreationData(serviceName: $serviceName, price: $price, iconImagePath: $iconImagePath, paymentCycle: $paymentCycle, firstPaidOn: $firstPaidOn, notification: $notification, memo: $memo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionCreationDataImpl &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.iconImagePath, iconImagePath) ||
                other.iconImagePath == iconImagePath) &&
            (identical(other.paymentCycle, paymentCycle) ||
                other.paymentCycle == paymentCycle) &&
            (identical(other.firstPaidOn, firstPaidOn) ||
                other.firstPaidOn == firstPaidOn) &&
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
      firstPaidOn,
      notification,
      memo,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionCreationDataImplCopyWith<_$SubscriptionCreationDataImpl>
      get copyWith => __$$SubscriptionCreationDataImplCopyWithImpl<
          _$SubscriptionCreationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionCreationDataImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionCreationData extends SubscriptionCreationData {
  const factory _SubscriptionCreationData(
          {required final String serviceName,
          required final String price,
          final String iconImagePath,
          required final int paymentCycle,
          @FirstPaidOnField() final DateTime? firstPaidOn,
          required final bool notification,
          required final String memo,
          @CreatedAtField() final DateTime? createdAt,
          @UpdatedAtField() final DateTime? updatedAt}) =
      _$SubscriptionCreationDataImpl;
  const _SubscriptionCreationData._() : super._();

  factory _SubscriptionCreationData.fromJson(Map<String, dynamic> json) =
      _$SubscriptionCreationDataImpl.fromJson;

  @override // サービス名
  String get serviceName;
  @override // 価格
  String get price;
  @override // アイコン画像パス
  String get iconImagePath;
  @override // 支払い周期
  int get paymentCycle;
  @override // 初回支払日
  @FirstPaidOnField()
  DateTime? get firstPaidOn;
  @override // 通知フラグ
  bool get notification;
  @override // メモ
  String get memo;
  @override // 作成日時
  @CreatedAtField()
  DateTime? get createdAt;
  @override // 更新日時
  @UpdatedAtField()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionCreationDataImplCopyWith<_$SubscriptionCreationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
