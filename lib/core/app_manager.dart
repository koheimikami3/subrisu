import 'dart:async';

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
      ref.read(purchaseStatusNotifierProvider.notifier).active();
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

    if (theme == ThemeSetting.device.index) {
      // 「端末設定と同じ」の場合、端末のテーマ設定を取得し、ダークモードか判定
      ref.read(themeSettingNotifierProvider.notifier).setDevice();
      ref
          .read(darkModeNotifierProvider.notifier)
          .setSetting(isDarkMode: isDarkMode(context));
    } else if (theme == ThemeSetting.light.index) {
      // 「ライトモード」の場合
      ref.read(themeSettingNotifierProvider.notifier).setLight();
      ref.read(darkModeNotifierProvider.notifier).setSetting(isDarkMode: false);
    } else if (theme == ThemeSetting.dark.index) {
      // 「ダークモード」の場合
      ref.read(themeSettingNotifierProvider.notifier).setDark();
      ref.read(darkModeNotifierProvider.notifier).setSetting(isDarkMode: true);
    }
  }

  /// リストの並び替え設定状況を取得し、アプリに反映する
  static Future<void> getListSort(WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    final sortIndex = prefs.getInt(configs.listSortKey) ?? 0;

    ref
        .read(subscriptionSortNotifierProvider.notifier)
        .setSetting(SubscriptionSort.values[sortIndex]);
  }

  static void checkForceAppVersion(BuildContext context) {
    final packageInfo = GetIt.I<PackageInfo>();
    final remoteKey = Platform.isIOS
        ? configs.forceAppVersionIOSRemoteKey
        : configs.forceAppVersionAndroidRemoteKey;

    // 強制アップデートバージョンを取得
    final strForceAppVersion =
        FirebaseRemoteConfig.instance.getString(remoteKey);
    final forceAppVersion = Version.parse(strForceAppVersion);

    // アプリの現在バージョンを取得
    final currentVersion = Version.parse(packageInfo.version);

    // 現在バージョンが強制アップデートバージョンより低い場合、
    // 強制アップデートダイアログを表示
    if (currentVersion < forceAppVersion) {
      ForceUpdateDialog.show(context, strForceAppVersion);
    }
  }

  /// 広告のトラッキングダイアログを表示する
  static Future<void> showAppTrackingTransparency() async {
    await AppTrackingTransparency.getAdvertisingIdentifier();
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
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

  // static Future<void> checkUpdateContents(BuildContext context) async {
  //   final remoteConfig = FirebaseRemoteConfig.instance;
  //   final packageInfo = GetIt.I<PackageInfo>();
  //   late final String strInfoVersion;
  //   late final String updateContents;

  //   // アップデート内容と表示するバージョンを取得
  //   if (Platform.isIOS) {
  //     strInfoVersion = remoteConfig.getString('infoVersionIOS');
  //     updateContents = remoteConfig.getString('updateContentsIOS');
  //   } else {
  //     strInfoVersion = remoteConfig.getString('infoVersionAndroid');
  //     updateContents = remoteConfig.getString('updateContentsAndroid');
  //   }
  //   final infoVersion = Version.parse(strInfoVersion);

  //   // アプリの現在バージョンを取得
  //   final currentVersion = Version.parse(packageInfo.version);

  //   // 現在バージョンが表示バージョン以上の場合、
  //   // アップデート内容ダイアログを表示
  //   if (currentVersion >= infoVersion) {
  //     unawaited(
  //       showCupertinoDialog<void>(
  //         context: context,
  //         builder: (_) => UpdateContentsDialog(
  //           version: strInfoVersion,
  //           contents: updateContents,
  //         ),
  //       ),
  //     );
  //   }
  // }
}
