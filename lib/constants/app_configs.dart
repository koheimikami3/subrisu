/// アプリケーション全体で使用される設定を管理する定数クラス
class AppConfigs {
  AppConfigs._();

  // テキストフォントサイズ
  static const defaultFontSize = 13.5;

  // 支払いリマインダーのデフォルト値
  static const defaultReminderIsEnabled = true;
  static const defaultReminderDaysBefore = 1;
  static const defaultReminderHour = 20;

  // 支払いリマインダーの「支払い日の何日前に通知するか」の選択値
  static const reminderDaysBeforeOptions = [0, 1, 2, 3, 7];
}
