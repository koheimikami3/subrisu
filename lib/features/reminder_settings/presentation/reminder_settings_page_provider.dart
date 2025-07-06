import '../../../importer.dart';

part 'reminder_settings_page_provider.g.dart';

/// ReminderSettingsPageのNotifierProvider
@riverpod
class ReminderSettingsPageNotifer extends _$ReminderSettingsPageNotifer {
  @override
  ReminderSettingsPageState build() => const ReminderSettingsPageState();

  // 画面の状態を初期化する
  void initState({
    required bool isEnabled,
    required int daysBefore,
    required int hour,
  }) {
    state = state.copyWith(
      isEnabled: isEnabled,
      selectedDaysBefore: daysBefore,
      resultDaysBefore: daysBefore,
      selectedHour: hour,
      resultHour: hour,
    );
  }

  // UserDocumentのnotification.paymentReminder.isEnabledを更新
  // リマインド通知の有効/無効の状態を更新する
  Future<void> setIsEnabled(bool value) async {
    ref.read(updateReminderIsEnabledProvider(value));
    state = state.copyWith(isEnabled: value);
  }

  // Pickerで選択中の「支払い日の何日前に通知するか」の状態を更新する
  void setSelectedDaysBefore(int value) {
    state = state.copyWith(selectedDaysBefore: value);
  }

  // UserDocumentのnotification.paymentReminder.daysBeforeを更新
  // 選択確定した「支払い日の何日前に通知するか」の状態を更新する
  Future<void> setResultDaysBefore() async {
    ref.read(updatePaymentReminderDaysBeforeProvider(state.selectedDaysBefore));
    state = state.copyWith(resultDaysBefore: state.selectedDaysBefore);
  }

  // Pickerで選択中の「何時に通知するか」の状態を更新する
  void setSelectedHour(int value) {
    state = state.copyWith(selectedHour: value);
  }

  // UserDocumentのnotification.paymentReminder.hourを更新
  // 選択確定した「何時に通知するか」の状態を更新する
  Future<void> setResultHour() async {
    ref.read(updatePaymentReminderHourProvider(state.selectedHour));
    state = state.copyWith(resultHour: state.selectedHour);
  }
}
