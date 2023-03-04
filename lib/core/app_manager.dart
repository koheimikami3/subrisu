import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../constant/configs.dart' as configs;
import '../importer.dart';

class AppManager {
  AppManager();

  /// 購入処理で使用するRevenueCatAPIを初期化する
  ///
  /// 課金ユーザーの場合はバナー広告を非表示にする
  static Future<void> initPurchases(WidgetRef ref) async {
    await Purchases.setLogLevel(LogLevel.debug);
    final apiKey = Platform.isIOS
        ? configs.revenueCatIOSKey
        : configs.revenueCatAndroidKey;

    // RevenueCatAPIを初期化
    await Purchases.configure(PurchasesConfiguration(apiKey));

    // 課金ユーザーか判定
    final customerInfo = await Purchases.getCustomerInfo();
    final entitlementInfo =
        customerInfo.entitlements.all[configs.entitlementId];

    // 課金ユーザーの場合、バナー広告を非表示にする
    if (entitlementInfo != null && entitlementInfo.isActive) {
      ref.read(isPurchasedProvider.notifier).state = true;
    }
  }

  /// 端末設定がダークモードか判定する
  static bool isDarkMode(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    return brightness == Brightness.dark;
  }

  /// テーマの設定状況を取得し、アプリに反映する
  static Future<void> getTheme(BuildContext context, WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();

    // テーマの設定状況を取得
    final theme = prefs.getInt(configs.themeKey) ?? 0;

    // 「端末設定と同じ」の場合、端末のテーマ設定を取得し、ダークモードか判定
    if (theme == configs.deviceTheme) {
      ref.read(themeProvider.notifier).state = configs.deviceTheme;
      ref.read(darkModeProvider.notifier).state = isDarkMode(context);
    }

    // 「ライトモード」の場合
    if (theme == configs.lightTheme) {
      ref.read(themeProvider.notifier).state = configs.lightTheme;
      ref.read(darkModeProvider.notifier).state = false;
    }

    // 「ダークモード」の場合
    if (theme == configs.darkTheme) {
      ref.read(themeProvider.notifier).state = configs.darkTheme;
      ref.read(darkModeProvider.notifier).state = true;
    }
  }

  static void checkForceAppVersion(BuildContext context) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final packageInfo = GetIt.I<PackageInfo>();
    late final String strForceAppVersion;

    // 強制アップデートバージョンを取得
    if (Platform.isIOS) {
      strForceAppVersion = remoteConfig.getString('forceAppVersionIOS');
    } else {
      strForceAppVersion = remoteConfig.getString('forceAppVersionAndroid');
    }
    final forceAppVersion = Version.parse(strForceAppVersion);

    // アプリの現在バージョンを取得
    final currentVersion = Version.parse(packageInfo.version);

    // 現在バージョンが強制アップデートバージョンより低い場合、
    // 強制アップデートダイアログを表示
    if (currentVersion < forceAppVersion) {
      ForceUpdateDialog.show(context, strForceAppVersion);
    }
  }

  static Future<void> checkUpdateContents(BuildContext context) async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final packageInfo = GetIt.I<PackageInfo>();
    late final String strInfoVersion;
    late final String updateContents;

    // アップデート内容と表示するバージョンを取得
    if (Platform.isIOS) {
      strInfoVersion = remoteConfig.getString('infoVersionIOS');
      updateContents = remoteConfig.getString('updateContentsIOS');
    } else {
      strInfoVersion = remoteConfig.getString('infoVersionAndroid');
      updateContents = remoteConfig.getString('updateContentsAndroid');
    }
    final infoVersion = Version.parse(strInfoVersion);

    // アプリの現在バージョンを取得
    final currentVersion = Version.parse(packageInfo.version);

    // 現在バージョンが表示バージョン以上の場合、
    // アップデート内容ダイアログを表示
    if (currentVersion >= infoVersion) {
      unawaited(
        showCupertinoDialog<void>(
          context: context,
          builder: (_) => UpdateContentsDialog(
            version: strInfoVersion,
            contents: updateContents,
          ),
        ),
      );
    }
  }

  /// プッシュ通知設定ダイアログの表示状況を取得し、初めての場合は表示する
  static Future<void> checkNotificationSetting() async {
    final prefs = GetIt.I<SharedPreferences>();
    final messaging = FirebaseMessaging.instance;

    // プッシュ通知設定ダイアログの表示状況を取得
    final notification = prefs.getBool(configs.notificationKey) ?? false;

    // 初めての場合はダイアログを表示
    if (!notification) {
      await messaging.requestPermission();

      await prefs.setBool(configs.notificationKey, true);
    }
  }
}
