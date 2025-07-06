// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_reminder_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentReminderSettings {
// 通知が有効かどうか
  bool get isEnabled => throw _privateConstructorUsedError; // 何日前に通知するか
  int get daysBefore => throw _privateConstructorUsedError; // 何時に通知するか
  int get hour => throw _privateConstructorUsedError;

  /// Create a copy of PaymentReminderSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentReminderSettingsCopyWith<PaymentReminderSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentReminderSettingsCopyWith<$Res> {
  factory $PaymentReminderSettingsCopyWith(PaymentReminderSettings value,
          $Res Function(PaymentReminderSettings) then) =
      _$PaymentReminderSettingsCopyWithImpl<$Res, PaymentReminderSettings>;
  @useResult
  $Res call({bool isEnabled, int daysBefore, int hour});
}

/// @nodoc
class _$PaymentReminderSettingsCopyWithImpl<$Res,
        $Val extends PaymentReminderSettings>
    implements $PaymentReminderSettingsCopyWith<$Res> {
  _$PaymentReminderSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentReminderSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? daysBefore = null,
    Object? hour = null,
  }) {
    return _then(_value.copyWith(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      daysBefore: null == daysBefore
          ? _value.daysBefore
          : daysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentReminderSettingsImplCopyWith<$Res>
    implements $PaymentReminderSettingsCopyWith<$Res> {
  factory _$$PaymentReminderSettingsImplCopyWith(
          _$PaymentReminderSettingsImpl value,
          $Res Function(_$PaymentReminderSettingsImpl) then) =
      __$$PaymentReminderSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isEnabled, int daysBefore, int hour});
}

/// @nodoc
class __$$PaymentReminderSettingsImplCopyWithImpl<$Res>
    extends _$PaymentReminderSettingsCopyWithImpl<$Res,
        _$PaymentReminderSettingsImpl>
    implements _$$PaymentReminderSettingsImplCopyWith<$Res> {
  __$$PaymentReminderSettingsImplCopyWithImpl(
      _$PaymentReminderSettingsImpl _value,
      $Res Function(_$PaymentReminderSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentReminderSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? daysBefore = null,
    Object? hour = null,
  }) {
    return _then(_$PaymentReminderSettingsImpl(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      daysBefore: null == daysBefore
          ? _value.daysBefore
          : daysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaymentReminderSettingsImpl extends _PaymentReminderSettings {
  const _$PaymentReminderSettingsImpl(
      {required this.isEnabled, required this.daysBefore, required this.hour})
      : super._();

// 通知が有効かどうか
  @override
  final bool isEnabled;
// 何日前に通知するか
  @override
  final int daysBefore;
// 何時に通知するか
  @override
  final int hour;

  @override
  String toString() {
    return 'PaymentReminderSettings(isEnabled: $isEnabled, daysBefore: $daysBefore, hour: $hour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentReminderSettingsImpl &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.daysBefore, daysBefore) ||
                other.daysBefore == daysBefore) &&
            (identical(other.hour, hour) || other.hour == hour));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled, daysBefore, hour);

  /// Create a copy of PaymentReminderSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentReminderSettingsImplCopyWith<_$PaymentReminderSettingsImpl>
      get copyWith => __$$PaymentReminderSettingsImplCopyWithImpl<
          _$PaymentReminderSettingsImpl>(this, _$identity);
}

abstract class _PaymentReminderSettings extends PaymentReminderSettings {
  const factory _PaymentReminderSettings(
      {required final bool isEnabled,
      required final int daysBefore,
      required final int hour}) = _$PaymentReminderSettingsImpl;
  const _PaymentReminderSettings._() : super._();

// 通知が有効かどうか
  @override
  bool get isEnabled; // 何日前に通知するか
  @override
  int get daysBefore; // 何時に通知するか
  @override
  int get hour;

  /// Create a copy of PaymentReminderSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentReminderSettingsImplCopyWith<_$PaymentReminderSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
