import '../constant/configs.dart' as configs;
import '../importer.dart';

class AppDataManager {
  /// ユーザードキュメントを取得する
  Future<void> getUser(WidgetRef ref) async {
    final auth = FirebaseAuth.instance;
    final messaging = FirebaseMessaging.instance;
    final userRepository = ref.read(userViewModelProvider.notifier);
    final subscriptionRepository =
        ref.read(subscriptionViewModelProvider.notifier);

    final userDoc = await userRepository.getUser(auth.currentUser!.uid);
    subscriptionRepository.getSubscriptions();

    final userToken = userDoc!.get('token');
    final deviceToken = await messaging.getToken();

    if (userToken != deviceToken) {
      await userRepository.updateToken(deviceToken!);
    }

    ref.watch(isUserDataLoadedProvider.notifier).state = true;
  }

  /// 現在の設定内容を取得し、アプリに反映する
  Future<void> getSettings(BuildContext context, WidgetRef ref) async {
    // アプリバージョンを取得し、プロバイダに保存
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    ref.watch(appVersionProvider.notifier).state = version;

    // テーマ設定状況を取得
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getInt(configs.themeKey) ?? 0;

    // 「端末設定と同じ」の場合、端末のテーマ設定を取得し、ダークモードか判定
    if (theme == configs.deviceTheme) {
      ref.watch(themeSettingProvider.notifier).state = configs.deviceTheme;

      final brightness = MediaQuery.platformBrightnessOf(context);
      final isDark = brightness == Brightness.dark;
      ref.watch(darkModeProvider.notifier).state = isDark;
    }

    // 「ライトモード」の場合
    if (theme == configs.lightTheme) {
      ref.watch(themeSettingProvider.notifier).state = configs.lightTheme;
      ref.watch(darkModeProvider.notifier).state = false;
    }

    // 「ダークモード」の場合
    if (theme == configs.darkTheme) {
      ref.watch(themeSettingProvider.notifier).state = configs.darkTheme;
      ref.watch(darkModeProvider.notifier).state = true;
    }
  }
}
