import '../../../importer.dart';
import '../constants/configs.dart' as configs;

part 'theme_settings_provider.g.dart';

/// テーマ設定のNotifierProvider
@riverpod
class ThemeSettingsNotifier extends _$ThemeSettingsNotifier {
  @override
  ThemeSetting build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // テーマの設定状況を取得
    final theme = prefs.getInt(configs.themeKey) ?? 0;

    if (theme == ThemeSetting.device.index) {
      return ThemeSetting.device;
    } else if (theme == ThemeSetting.light.index) {
      return ThemeSetting.light;
    } else {
      return ThemeSetting.dark;
    }
  }

  /// 状態をdeviceに更新
  void setDevice() {
    state = ThemeSetting.device;
  }

  /// 状態をlightに更新
  void setLight() {
    state = ThemeSetting.light;
  }

  /// 状態をdarkに更新
  void setDark() {
    state = ThemeSetting.dark;
  }
}
