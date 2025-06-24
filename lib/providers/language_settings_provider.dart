import '../../../importer.dart';

part 'language_settings_provider.g.dart';

/// アプリケーションの言語設定を管理するNotifierProvider
@riverpod
class LanguageSettingsNotifier extends _$LanguageSettingsNotifier {
  @override
  LanguageSettings build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // 言語の設定状況を取得
    var language = prefs.getInt(AppConfigs.languageSharedKey);

    // 未設定の場合、端末の言語設定が日本語の場合以外は英語に設定
    language ??=
        WidgetsBinding.instance.platformDispatcher.locale.languageCode ==
                AppConfigs.japaneseLanguageCode
            ? 0
            : 1;

    if (language == LanguageSettings.japanese.index) {
      return LanguageSettings.japanese;
    } else {
      return LanguageSettings.english;
    }
  }

  /// 状態をjapaneseに更新
  void setJapanese() {
    state = LanguageSettings.japanese;
    _saveLanguageSettings(LanguageSettings.japanese.index);
  }

  /// 状態をenglishに更新
  void setEnglish() {
    state = LanguageSettings.english;
    _saveLanguageSettings(LanguageSettings.english.index);
  }

  /// 言語設定をSharedPreferencesに保存
  void _saveLanguageSettings(int languageIndex) {
    final prefs = ref.read(sharedPreferencesProvider);
    prefs.setInt(AppConfigs.languageSharedKey, languageIndex);
  }
}
