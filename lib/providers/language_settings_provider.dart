import '../../../importer.dart';

part 'language_settings_provider.g.dart';

/// アプリケーションの言語設定を管理するNotifierProvider
@riverpod
class LanguageSettingsNotifier extends _$LanguageSettingsNotifier {
  @override
  LanguageSettings build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // 言語の設定状況を取得
    var languageIndex = prefs.getInt(AppConfigs.languageSharedKey);

    // 未設定の場合、端末の言語設定が日本語の場合以外は英語に設定
    languageIndex ??=
        WidgetsBinding.instance.platformDispatcher.locale.languageCode ==
                AppConfigs.japaneseLanguageCode
            ? LanguageSettings.japanese.index
            : LanguageSettings.english.index;

    return LanguageSettings.values[languageIndex];
  }

  /// 状態を指定したLanguageSettingsに更新
  ///
  /// 言語設定をSharedPreferencesに保存
  void set(LanguageSettings value) {
    final prefs = ref.read(sharedPreferencesProvider);

    state = value;
    prefs.setInt(AppConfigs.languageSharedKey, value.index);
  }
}
