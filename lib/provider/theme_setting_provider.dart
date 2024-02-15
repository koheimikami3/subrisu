import '../../../importer.dart';

part 'theme_setting_provider.g.dart';

/// テーマ設定のNotifierProvider
@riverpod
class ThemeSettingNotifier extends _$ThemeSettingNotifier {
  @override
  ThemeSetting build() => ThemeSetting.device;

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
