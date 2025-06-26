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
  static const subscriptionListSortKey = 'listSort';

  // アプリの起動回数のSharedPreferencesキー
  static const launchCountSharedKey = 'launchCount';

  // iOS版強制アップデートバージョンのRemoteConfigキー
  static const iOSForcedAppVersionRemoteKey = 'forceAppVersionIOS';

  // Android版強制アップデートバージョンのRemoteConfigキー
  static const androidForcedAppVersionRemoteKey = 'forceAppVersionAndroid';

  // 課金価格のRemoteConfigキー
  static const purchasePriceRemoteKey = 'purchasePrice';

  // 各OS
  static const iOS = 'iOS';
  static const android = 'Android';
}
