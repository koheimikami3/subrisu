import '../../../importer.dart';

part 'theme_settings_provider.g.dart';

/// アプリケーションのテーマ設定を管理するNotifierProvider
@riverpod
class ThemeSettingsNotifier extends _$ThemeSettingsNotifier {
  @override
  ThemeSettings build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // テーマの設定状況を取得
    // 未設定の場合、端末モードに設定
    final theme = prefs.getString(SheredPreferencesKeys.appTheme) ??
        ThemeSettings.device.name;

    return ThemeSettings.values.byName(theme);
  }

  /// 状態を指定したThemeSettingsに更新
  ///
  /// テーマ設定をSharedPreferencesに保存
  void set(ThemeSettings value) {
    final prefs = ref.read(sharedPreferencesProvider);

    state = value;
    prefs.setString(SheredPreferencesKeys.appTheme, value.name);
  }
}
