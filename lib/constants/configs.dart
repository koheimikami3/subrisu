/// アプリケーション全体で使用される設定を管理する定数クラス
class AppConfigs {
  AppConfigs._();

  // テキストデフォルトフォントサイズ
  static const defaultFontSize = 13.5;

  // テーマ設定のSharedPreferencesキー
  static const themeSharedKey = 'theme';

  // テーマ設定のSharedPreferencesキー
  static const themeSettingsSharedKey = 'themeSettings';

  // 言語設定のSharedPreferencesキー
  static const languageSharedKey = 'language';

  // 言語設定のSharedPreferencesキー
  static const languageSettingsSharedKey = 'languageSettings';

  // 通貨設定のSharedPreferencesキー
  static const currencySharedKey = 'currency';

  // サブスクリプションリストの並び替え設定のSharedPreferencesキー
  static const subscriptionSortOrderSharedKey = 'subscriptionSortOrder';

  // アプリの起動回数のSharedPreferencesキー
  static const launchCountSharedKey = 'launchCount';
}
