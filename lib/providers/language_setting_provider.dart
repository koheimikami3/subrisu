import '../../../importer.dart';
import '../constants/configs.dart' as configs;

part 'language_setting_provider.g.dart';

/// 言語設定のNotifierProvider
@riverpod
class LanguageSettingNotifier extends _$LanguageSettingNotifier {
  @override
  LanguageSetting build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // 言語の設定状況を取得
    var language = prefs.getInt(configs.languageKey);

    // 未設定の場合、端末の言語設定が日本語の場合以外は英語に設定
    language ??=
        WidgetsBinding.instance.platformDispatcher.locale.languageCode == 'ja'
            ? 0
            : 1;

    if (language == LanguageSetting.japanese.index) {
      return LanguageSetting.japanese;
    } else {
      return LanguageSetting.english;
    }
  }

  /// 状態をjapaneseに更新
  void setJapanese() {
    state = LanguageSetting.japanese;
  }

  /// 状態をenglishに更新
  void setEnglish() {
    state = LanguageSetting.english;
  }
}
