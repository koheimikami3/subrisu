import '../../../importer.dart';
import '../constants/configs.dart' as configs;

part 'theme_settings_provider.g.dart';

/// アプリケーションのテーマ設定を管理するNotifierProvider
@riverpod
class ThemeSettingsNotifier extends _$ThemeSettingsNotifier {
  @override
  ThemeSettings build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // テーマの設定状況を取得
    final theme = prefs.getInt(configs.themeKey) ?? 0;

    if (theme == ThemeSettings.device.index) {
      return ThemeSettings.device;
    } else if (theme == ThemeSettings.light.index) {
      return ThemeSettings.light;
    } else {
      return ThemeSettings.dark;
    }
  }

  /// 状態をdeviceに更新
  void setDevice() {
    state = ThemeSettings.device;
  }

  /// 状態をlightに更新
  void setLight() {
    state = ThemeSettings.light;
  }

  /// 状態をdarkに更新
  void setDark() {
    state = ThemeSettings.dark;
  }
}
