// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Subscription {
// ドキュメントID
  String get id => throw _privateConstructorUsedError; // サービス名
  String get serviceName => throw _privateConstructorUsedError; // 価格
  String get price => throw _privateConstructorUsedError; // アイコン画像パス
  String get iconImagePath => throw _privateConstructorUsedError; // 支払い周期
  int get paymentCycle => throw _privateConstructorUsedError; // 初回支払日
  Timestamp get firstPaidOn => throw _privateConstructorUsedError; // 通知フラグ
  bool get notification => throw _privateConstructorUsedError; // メモ
  String get memo => throw _privateConstructorUsedError; // 作成日
  Timestamp get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
          Subscription value, $Res Function(Subscription) then) =
      _$SubscriptionCopyWithImpl<$Res, Subscription>;
  @useResult
  $Res call(
      {String id,
      String serviceName,
      String price,
      String iconImagePath,
      int paymentCycle,
      Timestamp firstPaidOn,
      bool notification,
      String memo,
      Timestamp createdAt});
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res, $Val extends Subscription>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceName = null,
    Object? price = null,
    Object? iconImagePath = null,
    Object? paymentCycle = null,
    Object? firstPaidOn = null,
    Object? notification = null,
    Object? memo = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      firstPaidOn: null == firstPaidOn
          ? _value.firstPaidOn
          : firstPaidOn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionImplCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$SubscriptionImplCopyWith(
          _$SubscriptionImpl value, $Res Function(_$SubscriptionImpl) then) =
      __$$SubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String serviceName,
      String price,
      String iconImagePath,
      int paymentCycle,
      Timestamp firstPaidOn,
      bool notification,
      String memo,
      Timestamp createdAt});
}

/// @nodoc
class __$$SubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$SubscriptionImpl>
    implements _$$SubscriptionImplCopyWith<$Res> {
  __$$SubscriptionImplCopyWithImpl(
      _$SubscriptionImpl _value, $Res Function(_$SubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceName = null,
    Object? price = null,
    Object? iconImagePath = null,
    Object? paymentCycle = null,
    Object? firstPaidOn = null,
    Object? notification = null,
    Object? memo = null,
    Object? createdAt = null,
  }) {
    return _then(_$SubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      firstPaidOn: null == firstPaidOn
          ? _value.firstPaidOn
          : firstPaidOn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

class _$SubscriptionImpl extends _Subscription {
  const _$SubscriptionImpl(
      {required this.id,
      required this.serviceName,
      required this.price,
      required this.iconImagePath,
      required this.paymentCycle,
      required this.firstPaidOn,
      required this.notification,
      required this.memo,
      required this.createdAt})
      : super._();

// ドキュメントID
  @override
  final String id;
// サービス名
  @override
  final String serviceName;
// 価格
  @override
  final String price;
// アイコン画像パス
  @override
  final String iconImagePath;
// 支払い周期
  @override
  final int paymentCycle;
// 初回支払日
  @override
  final Timestamp firstPaidOn;
// 通知フラグ
  @override
  final bool notification;
// メモ
  @override
  final String memo;
// 作成日
  @override
  final Timestamp createdAt;

  @override
  String toString() {
    return 'Subscription(id: $id, serviceName: $serviceName, price: $price, iconImagePath: $iconImagePath, paymentCycle: $paymentCycle, firstPaidOn: $firstPaidOn, notification: $notification, memo: $memo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
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
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, serviceName, price,
      iconImagePath, paymentCycle, firstPaidOn, notification, memo, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      __$$SubscriptionImplCopyWithImpl<_$SubscriptionImpl>(this, _$identity);
}

abstract class _Subscription extends Subscription {
  const factory _Subscription(
      {required final String id,
      required final String serviceName,
      required final String price,
      required final String iconImagePath,
      required final int paymentCycle,
      required final Timestamp firstPaidOn,
      required final bool notification,
      required final String memo,
      required final Timestamp createdAt}) = _$SubscriptionImpl;
  const _Subscription._() : super._();

  @override // ドキュメントID
  String get id;
  @override // サービス名
  String get serviceName;
  @override // 価格
  String get price;
  @override // アイコン画像パス
  String get iconImagePath;
  @override // 支払い周期
  int get paymentCycle;
  @override // 初回支払日
  Timestamp get firstPaidOn;
  @override // 通知フラグ
  bool get notification;
  @override // メモ
  String get memo;
  @override // 作成日
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
