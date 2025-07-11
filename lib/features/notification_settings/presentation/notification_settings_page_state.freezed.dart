// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_settings_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationSettingsPageState {
// リマインド通知の有効/無効
  bool get isEnabled =>
      throw _privateConstructorUsedError; // Pickerで選択中の「支払い日の何日前に通知するか」
  int get selectedDaysBefore =>
      throw _privateConstructorUsedError; // 選択確定した「支払い日の何日前に通知するか」
  int get resultDaysBefore => throw _privateConstructorUsedError;

  /// Pickerで選択中の「何時に通知するか」
  int get selectedHour =>
      throw _privateConstructorUsedError; // 選択確定した「何時に通知するか」
  int get resultHour => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettingsPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsPageStateCopyWith<NotificationSettingsPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsPageStateCopyWith<$Res> {
  factory $NotificationSettingsPageStateCopyWith(
          NotificationSettingsPageState value,
          $Res Function(NotificationSettingsPageState) then) =
      _$NotificationSettingsPageStateCopyWithImpl<$Res,
          NotificationSettingsPageState>;
  @useResult
  $Res call(
      {bool isEnabled,
      int selectedDaysBefore,
      int resultDaysBefore,
      int selectedHour,
      int resultHour});
}

/// @nodoc
class _$NotificationSettingsPageStateCopyWithImpl<$Res,
        $Val extends NotificationSettingsPageState>
    implements $NotificationSettingsPageStateCopyWith<$Res> {
  _$NotificationSettingsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettingsPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? selectedDaysBefore = null,
    Object? resultDaysBefore = null,
    Object? selectedHour = null,
    Object? resultHour = null,
  }) {
    return _then(_value.copyWith(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDaysBefore: null == selectedDaysBefore
          ? _value.selectedDaysBefore
          : selectedDaysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      resultDaysBefore: null == resultDaysBefore
          ? _value.resultDaysBefore
          : resultDaysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      selectedHour: null == selectedHour
          ? _value.selectedHour
          : selectedHour // ignore: cast_nullable_to_non_nullable
              as int,
      resultHour: null == resultHour
          ? _value.resultHour
          : resultHour // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingsPageStateImplCopyWith<$Res>
    implements $NotificationSettingsPageStateCopyWith<$Res> {
  factory _$$NotificationSettingsPageStateImplCopyWith(
          _$NotificationSettingsPageStateImpl value,
          $Res Function(_$NotificationSettingsPageStateImpl) then) =
      __$$NotificationSettingsPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEnabled,
      int selectedDaysBefore,
      int resultDaysBefore,
      int selectedHour,
      int resultHour});
}

/// @nodoc
class __$$NotificationSettingsPageStateImplCopyWithImpl<$Res>
    extends _$NotificationSettingsPageStateCopyWithImpl<$Res,
        _$NotificationSettingsPageStateImpl>
    implements _$$NotificationSettingsPageStateImplCopyWith<$Res> {
  __$$NotificationSettingsPageStateImplCopyWithImpl(
      _$NotificationSettingsPageStateImpl _value,
      $Res Function(_$NotificationSettingsPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSettingsPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? selectedDaysBefore = null,
    Object? resultDaysBefore = null,
    Object? selectedHour = null,
    Object? resultHour = null,
  }) {
    return _then(_$NotificationSettingsPageStateImpl(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDaysBefore: null == selectedDaysBefore
          ? _value.selectedDaysBefore
          : selectedDaysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      resultDaysBefore: null == resultDaysBefore
          ? _value.resultDaysBefore
          : resultDaysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      selectedHour: null == selectedHour
          ? _value.selectedHour
          : selectedHour // ignore: cast_nullable_to_non_nullable
              as int,
      resultHour: null == resultHour
          ? _value.resultHour
          : resultHour // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NotificationSettingsPageStateImpl
    extends _NotificationSettingsPageState {
  const _$NotificationSettingsPageStateImpl(
      {this.isEnabled = true,
      this.selectedDaysBefore = AppConfigs.defaultReminderDaysBefore,
      this.resultDaysBefore = AppConfigs.defaultReminderDaysBefore,
      this.selectedHour = AppConfigs.defaultReminderHour,
      this.resultHour = AppConfigs.defaultReminderHour})
      : super._();

// リマインド通知の有効/無効
  @override
  @JsonKey()
  final bool isEnabled;
// Pickerで選択中の「支払い日の何日前に通知するか」
  @override
  @JsonKey()
  final int selectedDaysBefore;
// 選択確定した「支払い日の何日前に通知するか」
  @override
  @JsonKey()
  final int resultDaysBefore;

  /// Pickerで選択中の「何時に通知するか」
  @override
  @JsonKey()
  final int selectedHour;
// 選択確定した「何時に通知するか」
  @override
  @JsonKey()
  final int resultHour;

  @override
  String toString() {
    return 'NotificationSettingsPageState(isEnabled: $isEnabled, selectedDaysBefore: $selectedDaysBefore, resultDaysBefore: $resultDaysBefore, selectedHour: $selectedHour, resultHour: $resultHour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsPageStateImpl &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.selectedDaysBefore, selectedDaysBefore) ||
                other.selectedDaysBefore == selectedDaysBefore) &&
            (identical(other.resultDaysBefore, resultDaysBefore) ||
                other.resultDaysBefore == resultDaysBefore) &&
            (identical(other.selectedHour, selectedHour) ||
                other.selectedHour == selectedHour) &&
            (identical(other.resultHour, resultHour) ||
                other.resultHour == resultHour));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled, selectedDaysBefore,
      resultDaysBefore, selectedHour, resultHour);

  /// Create a copy of NotificationSettingsPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsPageStateImplCopyWith<
          _$NotificationSettingsPageStateImpl>
      get copyWith => __$$NotificationSettingsPageStateImplCopyWithImpl<
          _$NotificationSettingsPageStateImpl>(this, _$identity);
}

abstract class _NotificationSettingsPageState
    extends NotificationSettingsPageState {
  const factory _NotificationSettingsPageState(
      {final bool isEnabled,
      final int selectedDaysBefore,
      final int resultDaysBefore,
      final int selectedHour,
      final int resultHour}) = _$NotificationSettingsPageStateImpl;
  const _NotificationSettingsPageState._() : super._();

// リマインド通知の有効/無効
  @override
  bool get isEnabled; // Pickerで選択中の「支払い日の何日前に通知するか」
  @override
  int get selectedDaysBefore; // 選択確定した「支払い日の何日前に通知するか」
  @override
  int get resultDaysBefore;

  /// Pickerで選択中の「何時に通知するか」
  @override
  int get selectedHour; // 選択確定した「何時に通知するか」
  @override
  int get resultHour;

  /// Create a copy of NotificationSettingsPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsPageStateImplCopyWith<
          _$NotificationSettingsPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
