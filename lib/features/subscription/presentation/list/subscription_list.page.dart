import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/components/my_banner_ad.dart';
import 'package:subrisu/constants/remote_config_keys.dart';
import 'package:subrisu/constants/shered_preferences_keys.dart';
import 'package:subrisu/features/subscription/presentation/list/subscription_list.page_body.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/forced_update_dialog.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/go_to_create_subscription_page_button.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/go_to_settings_page_button.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/sort_subscription_button.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/total_price.dart';
import 'package:subrisu/providers/firebase_messaging_provider.dart';
import 'package:subrisu/providers/firebase_remote_config_provider.dart';
import 'package:subrisu/providers/in_app_review_provider.dart';
import 'package:subrisu/providers/package_info_provider.dart';
import 'package:subrisu/providers/shared_preferences_provider.dart';
import 'package:version/version.dart';

/// サブスクリプション一覧画面
class SubscriptionListPage extends ConsumerStatefulWidget {
  const SubscriptionListPage({super.key});

  @override
  ConsumerState<SubscriptionListPage> createState() =>
      _SubscriptionListPageState();
}

class _SubscriptionListPageState extends ConsumerState<SubscriptionListPage> {
  @override
  void initState() {
    super.initState();

    // 画面描画後に処理を実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showForcedUpdateDialog();
      _showAppTrackingTransparencyDialog();
      _showNotificationDialog();
      _showRequestReviewDialog();
    });
  }

  /// アプリのバージョンが強制アップデート対象の場合、
  /// 強制アップデートダイアログを表示する
  void _showForcedUpdateDialog() {
    final remoteKey = Platform.isIOS
        ? RemoteConfigKeys.iOSForcedAppVersion
        : RemoteConfigKeys.androidForcedAppVersion;

    // 強制アップデートバージョンを取得
    final strForcedUpdateVersion =
        ref.read(firebaseRemoteConfigProvider).getString(remoteKey);
    final forcedUpdateVersion = Version.parse(strForcedUpdateVersion);

    // アプリの現在バージョンを取得
    final currentVersion = Version.parse(ref.read(packageInfoProvider).version);

    // 現在バージョンが強制アップデートバージョンより低い場合、
    // 強制アップデートダイアログを表示
    if (currentVersion < forcedUpdateVersion) {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return ForcedUpdateDialog(
            forcedUpdateVersion: strForcedUpdateVersion,
          );
        },
      );
    }
  }

  /// 初回起動の場合、広告トラッキング許可ダイアログを表示する
  Future<void> _showAppTrackingTransparencyDialog() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  /// 初回起動の場合、プッシュ通知許可ダイアログを表示する
  Future<void> _showNotificationDialog() async {
    final messaging = ref.read(firebaseMessagingProvider);
    final settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus == AuthorizationStatus.notDetermined) {
      await messaging.requestPermission();
    }
  }

  /// アプリの起動が5回目の場合、評価リクエストダイアログを表示する
  Future<void> _showRequestReviewDialog() async {
    final inAppReview = ref.read(inAppReviewProvider);
    final pref = ref.read(sharedPreferencesProvider);
    final launchCount = pref.getInt(SheredPreferencesKeys.launchCount) ?? 0;

    if (launchCount == 5 && await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 10.w),
            const TotalPrice(),
          ],
        ),
        centerTitle: false,
        actions: [
          Row(
            children: [
              const SortSubscriptionButton(),
              const GoToSettingsPageButton(),
              SizedBox(width: 10.w),
            ],
          ),
        ],
      ),
      floatingActionButton: const GoToCreateSubscriptionPageButton(),
      body: const Column(
        children: [
          Expanded(child: SubscriptionListPageBody()),
          MyBannerAd(),
        ],
      ),
    );
  }
}
