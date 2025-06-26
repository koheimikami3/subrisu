/// 言語設定
enum LanguageSettings {
  japanese('ja'),
  english('en');

  const LanguageSettings(this.code);

  final String code;

  /// 言語コードから対応するLanguageSettingsを取得
  static LanguageSettings fromCode(String code) {
    return LanguageSettings.values.firstWhere(
      (language) => language.code.toLowerCase() == code.toLowerCase(),
    );
  }
}
