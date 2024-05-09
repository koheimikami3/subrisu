import '../../../importer.dart';
import '../constant/configs.dart' as configs;

part 'purchase_status_provider.g.dart';

/// 画面テーマ設定のNotifierProvider
@riverpod
class PurchaseStatusNotifier extends _$PurchaseStatusNotifier {
  @override
  PurchaseStatus build() => PurchaseStatus.inactive;

  /// 購入処理で使用するRevenueCatAPIを初期化する
  ///
  /// 課金ユーザーの場合はバナー広告を非表示にする
  Future<void> initStatus() async {
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
      setActive();
    }
  }

  /// 購入ステータスの状態をactiveに更新
  void setActive() {
    state = PurchaseStatus.active;
  }
}
