// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReminderSettings {
// リマインダーを有効にするかどうか
  bool get isEnabled => throw _privateConstructorUsedError; // 何日前に通知するか
  int get daysBefore => throw _privateConstructorUsedError; // 何時に通知するか
  int get hour => throw _privateConstructorUsedError;

  /// Create a copy of ReminderSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderSettingsCopyWith<ReminderSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderSettingsCopyWith<$Res> {
  factory $ReminderSettingsCopyWith(
          ReminderSettings value, $Res Function(ReminderSettings) then) =
      _$ReminderSettingsCopyWithImpl<$Res, ReminderSettings>;
  @useResult
  $Res call({bool isEnabled, int daysBefore, int hour});
}

/// @nodoc
class _$ReminderSettingsCopyWithImpl<$Res, $Val extends ReminderSettings>
    implements $ReminderSettingsCopyWith<$Res> {
  _$ReminderSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderSettings
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
abstract class _$$ReminderSettingsImplCopyWith<$Res>
    implements $ReminderSettingsCopyWith<$Res> {
  factory _$$ReminderSettingsImplCopyWith(_$ReminderSettingsImpl value,
          $Res Function(_$ReminderSettingsImpl) then) =
      __$$ReminderSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isEnabled, int daysBefore, int hour});
}

/// @nodoc
class __$$ReminderSettingsImplCopyWithImpl<$Res>
    extends _$ReminderSettingsCopyWithImpl<$Res, _$ReminderSettingsImpl>
    implements _$$ReminderSettingsImplCopyWith<$Res> {
  __$$ReminderSettingsImplCopyWithImpl(_$ReminderSettingsImpl _value,
      $Res Function(_$ReminderSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? daysBefore = null,
    Object? hour = null,
  }) {
    return _then(_$ReminderSettingsImpl(
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

class _$ReminderSettingsImpl extends _ReminderSettings {
  const _$ReminderSettingsImpl(
      {required this.isEnabled, required this.daysBefore, required this.hour})
      : super._();

// リマインダーを有効にするかどうか
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
    return 'ReminderSettings(isEnabled: $isEnabled, daysBefore: $daysBefore, hour: $hour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderSettingsImpl &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.daysBefore, daysBefore) ||
                other.daysBefore == daysBefore) &&
            (identical(other.hour, hour) || other.hour == hour));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled, daysBefore, hour);

  /// Create a copy of ReminderSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderSettingsImplCopyWith<_$ReminderSettingsImpl> get copyWith =>
      __$$ReminderSettingsImplCopyWithImpl<_$ReminderSettingsImpl>(
          this, _$identity);
}

abstract class _ReminderSettings extends ReminderSettings {
  const factory _ReminderSettings(
      {required final bool isEnabled,
      required final int daysBefore,
      required final int hour}) = _$ReminderSettingsImpl;
  const _ReminderSettings._() : super._();

// リマインダーを有効にするかどうか
  @override
  bool get isEnabled; // 何日前に通知するか
  @override
  int get daysBefore; // 何時に通知するか
  @override
  int get hour;

  /// Create a copy of ReminderSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderSettingsImplCopyWith<_$ReminderSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
