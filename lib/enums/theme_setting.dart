/// テーマ設定
enum ThemeSetting {
  /// 端末モード
  device('端末設定と同じ'),

  /// ライトモード
  light('ライトモード'),

  /// ダークモード
  dark('ダークモード'),
  ;

  const ThemeSetting(this.name);

  final String name;
}
