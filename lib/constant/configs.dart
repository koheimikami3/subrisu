import 'package:subrisu/importer.dart';

class Configs {
  // アプリカラー
  static const appColor = Color.fromARGB(255, 0, 180, 160);

  // ダークモード時の背景色
  static const darkBackgroundColor = Color(0xFF212121);

  // ダークモード時の項目色
  static const darkItemColor = Color(0xFF303030);

  // 設定画面の背景色
  static const settingsBackgroundColor = Color.fromRGBO(240, 240, 245, 1);

  // ユーザーIDキー
  static const userIdKey = 'userId';

  // テーマ設定キー
  static const themeKey = 'theme';

  // テーマ設定インデックス
  // ０：端末設定 １：ライドモード　　２：ダークモード
  static const deviceTheme = 0;
  static const lightTheme = 1;
  static const darkTheme = 2;

  // スプラッシュのアイコン画像パス
  static const splashImagePath = 'assets/images/splash.png';

  // Appleのアイコン画像パス
  static const appleIconImagePath = 'assets/images/os_icon/apple_icon.png';

  // Googleのアイコン画像パス
  static const googleIconImagePath = 'assets/images/os_icon/google_icon.png';
}
