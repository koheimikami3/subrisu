import '../constant/configs.dart' as configs;
import '../importer.dart';

class AppManager {
  const AppManager();

  /// アプリバージョンを取得し、プロバイダに保存する
  static Future<void> getVersion(WidgetRef ref) async {
    final packageInfo = await PackageInfo.fromPlatform();

    ref.watch(appVersionProvider.notifier).state = packageInfo.version;
  }

  /// テーマの設定状況を取得し、アプリに反映する
  static Future<void> getTheme(BuildContext context, WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();

    // テーマの設定状況を取得
    final theme = prefs.getInt(configs.themeKey) ?? 0;

    // 「端末設定と同じ」の場合、端末のテーマ設定を取得し、ダークモードか判定
    if (theme == configs.deviceTheme) {
      ref.watch(themeProvider.notifier).state = configs.deviceTheme;

      final brightness = MediaQuery.platformBrightnessOf(context);
      final isDark = brightness == Brightness.dark;
      ref.watch(darkModeProvider.notifier).state = isDark;
    }

    // 「ライトモード」の場合
    if (theme == configs.lightTheme) {
      ref.watch(themeProvider.notifier).state = configs.lightTheme;
      ref.watch(darkModeProvider.notifier).state = false;
    }

    // 「ダークモード」の場合
    if (theme == configs.darkTheme) {
      ref.watch(themeProvider.notifier).state = configs.darkTheme;
      ref.watch(darkModeProvider.notifier).state = true;
    }
  }

  /// プッシュ通知設定ダイアログの表示状況を取得し、初めての場合は表示する
  static Future<void> getNotification() async {
    final messaging = FirebaseMessaging.instance;
    final prefs = await SharedPreferences.getInstance();

    // プッシュ通知設定ダイアログの表示状況を取得
    final notification = prefs.getBool(configs.notificationKey) ?? false;

    // 初めての場合はダイアログを表示
    if (!notification) {
      await messaging.requestPermission();

      await prefs.setBool(configs.notificationKey, true);
    }
  }
}
