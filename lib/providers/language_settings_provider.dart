import '../../../importer.dart';

part 'language_settings_provider.g.dart';

/// アプリケーションの言語設定を管理するNotifierProvider
@riverpod
class LanguageSettingsNotifier extends _$LanguageSettingsNotifier {
  @override
  LanguageSettings build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // 言語の設定状況を取得
    var languageCode =
        prefs.getString(SheredPreferencesKeys.languageSettingsSharedKey);

    // 未設定の場合、端末の言語設定が日本語の場合以外は英語に設定
    languageCode ??=
        WidgetsBinding.instance.platformDispatcher.locale.languageCode ==
                LanguageSettings.japanese.code
            ? LanguageSettings.japanese.code
            : LanguageSettings.english.code;

    return LanguageSettings.fromCode(languageCode);
  }

  /// 状態を指定したLanguageSettingsに更新
  ///
  /// 言語コードをSharedPreferencesに保存
  void set(LanguageSettings value) {
    final prefs = ref.read(sharedPreferencesProvider);

    state = value;
    prefs.setString(
        SheredPreferencesKeys.languageSettingsSharedKey, value.code);
  }
}
