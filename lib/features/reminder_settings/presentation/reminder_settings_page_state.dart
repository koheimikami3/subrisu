import '../../../importer.dart';

part 'reminder_settings_page_state.freezed.dart';

/// ReminderSettingsPageのState
@freezed
abstract class ReminderSettingsPageState
    implements _$ReminderSettingsPageState {
  const factory ReminderSettingsPageState({
    // リマインド通知の有効/無効
    @Default(true) bool isEnabled,

    // Pickerで選択中の「支払い日の何日前に通知するか」
    @Default(AppConfigs.defaultReminderDaysBefore) int selectedDaysBefore,

    // 選択確定した「支払い日の何日前に通知するか」
    @Default(AppConfigs.defaultReminderDaysBefore) int resultDaysBefore,

    /// Pickerで選択中の「何時に通知するか」
    @Default(AppConfigs.defaultReminderHour) int selectedHour,

    // 選択確定した「何時に通知するか」
    @Default(AppConfigs.defaultReminderHour) int resultHour,
  }) = _ReminderSettingsPageState;

  const ReminderSettingsPageState._();
}
