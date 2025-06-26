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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Subscription {
// ドキュメントID
  String get id => throw _privateConstructorUsedError; // サービス名
  String get serviceName => throw _privateConstructorUsedError; // 価格
  num get price => throw _privateConstructorUsedError; // アイコン画像パス
  String get iconImagePath => throw _privateConstructorUsedError; // 支払い周期
  PaymentCycle get paymentCycle => throw _privateConstructorUsedError; // 初回支払日
  Timestamp get firstPaidOn =>
      throw _privateConstructorUsedError; // 通知を有効にするかどうか
  bool get isNotificationEnabled => throw _privateConstructorUsedError; // メモ
  String? get note => throw _privateConstructorUsedError; // 作成日
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      num price,
      String iconImagePath,
      PaymentCycle paymentCycle,
      Timestamp firstPaidOn,
      bool isNotificationEnabled,
      String? note,
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

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceName = null,
    Object? price = null,
    Object? iconImagePath = null,
    Object? paymentCycle = null,
    Object? firstPaidOn = null,
    Object? isNotificationEnabled = null,
    Object? note = freezed,
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
              as num,
      iconImagePath: null == iconImagePath
          ? _value.iconImagePath
          : iconImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCycle: null == paymentCycle
          ? _value.paymentCycle
          : paymentCycle // ignore: cast_nullable_to_non_nullable
              as PaymentCycle,
      firstPaidOn: null == firstPaidOn
          ? _value.firstPaidOn
          : firstPaidOn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      isNotificationEnabled: null == isNotificationEnabled
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
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
      num price,
      String iconImagePath,
      PaymentCycle paymentCycle,
      Timestamp firstPaidOn,
      bool isNotificationEnabled,
      String? note,
      Timestamp createdAt});
}

/// @nodoc
class __$$SubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$SubscriptionImpl>
    implements _$$SubscriptionImplCopyWith<$Res> {
  __$$SubscriptionImplCopyWithImpl(
      _$SubscriptionImpl _value, $Res Function(_$SubscriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceName = null,
    Object? price = null,
    Object? iconImagePath = null,
    Object? paymentCycle = null,
    Object? firstPaidOn = null,
    Object? isNotificationEnabled = null,
    Object? note = freezed,
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
              as num,
      iconImagePath: null == iconImagePath
          ? _value.iconImagePath
          : iconImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCycle: null == paymentCycle
          ? _value.paymentCycle
          : paymentCycle // ignore: cast_nullable_to_non_nullable
              as PaymentCycle,
      firstPaidOn: null == firstPaidOn
          ? _value.firstPaidOn
          : firstPaidOn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      isNotificationEnabled: null == isNotificationEnabled
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
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
      required this.isNotificationEnabled,
      required this.note,
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
  final num price;
// アイコン画像パス
  @override
  final String iconImagePath;
// 支払い周期
  @override
  final PaymentCycle paymentCycle;
// 初回支払日
  @override
  final Timestamp firstPaidOn;
// 通知を有効にするかどうか
  @override
  final bool isNotificationEnabled;
// メモ
  @override
  final String? note;
// 作成日
  @override
  final Timestamp createdAt;

  @override
  String toString() {
    return 'Subscription(id: $id, serviceName: $serviceName, price: $price, iconImagePath: $iconImagePath, paymentCycle: $paymentCycle, firstPaidOn: $firstPaidOn, isNotificationEnabled: $isNotificationEnabled, note: $note, createdAt: $createdAt)';
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
            (identical(other.isNotificationEnabled, isNotificationEnabled) ||
                other.isNotificationEnabled == isNotificationEnabled) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      serviceName,
      price,
      iconImagePath,
      paymentCycle,
      firstPaidOn,
      isNotificationEnabled,
      note,
      createdAt);

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      __$$SubscriptionImplCopyWithImpl<_$SubscriptionImpl>(this, _$identity);
}

abstract class _Subscription extends Subscription {
  const factory _Subscription(
      {required final String id,
      required final String serviceName,
      required final num price,
      required final String iconImagePath,
      required final PaymentCycle paymentCycle,
      required final Timestamp firstPaidOn,
      required final bool isNotificationEnabled,
      required final String? note,
      required final Timestamp createdAt}) = _$SubscriptionImpl;
  const _Subscription._() : super._();

// ドキュメントID
  @override
  String get id; // サービス名
  @override
  String get serviceName; // 価格
  @override
  num get price; // アイコン画像パス
  @override
  String get iconImagePath; // 支払い周期
  @override
  PaymentCycle get paymentCycle; // 初回支払日
  @override
  Timestamp get firstPaidOn; // 通知を有効にするかどうか
  @override
  bool get isNotificationEnabled; // メモ
  @override
  String? get note; // 作成日
  @override
  Timestamp get createdAt;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
