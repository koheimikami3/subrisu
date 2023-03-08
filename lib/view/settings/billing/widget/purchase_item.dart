import '../../../../constant/configs.dart' as configs;
import '../../../../constant/exceptions.dart' as exceptions;
import '../../../../constant/texts.dart' as texts;
import '../../../../importer.dart';

/// 購入処理を行う項目
class PurchaseItem extends ConsumerWidget {
  const PurchaseItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPurchased = ref.watch(isPurchasedProvider);

    return SettingItem(
      topItem: true,
      itemName: texts.removeAdsItem,
      leadingIcon: null,
      trailing: _price(ref, isPurchased),
      onTap: () => isPurchased ? null : _onTap(context, ref),
    );
  }

  /// 価格を表示する
  Widget _price(WidgetRef ref, bool isPurchased) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final isDark = ref.watch(darkModeProvider);
    const purchasedText = '購入済み';

    // 購入価格テキストを作成
    final price = remoteConfig.getString('purchasePrice');
    final text = '¥$price';

    return Text(
      isPurchased ? purchasedText : text,
      style: TextStyle(
        color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
      ),
    );
  }

  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    late final Offerings offerings;
    late final CustomerInfo customerInfo;

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // RevenueCatのofferingsを取得
      offerings = await Purchases.getOfferings();
    } on PlatformException {
      // プログレスダイアログを閉じる
      Navigator.pop(context);

      // エラーダイアログを表示
      final message = exceptions.messageMap[exceptions.noPurchaseItem];
      MyAlertDialog.showError(context, message!);
      return;
    }

    // StateがCurrentになっているofferingを取得
    // 購入するpackageを取得
    final offering = offerings.current;
    final package = offering!.lifetime;

    try {
      // 購入処理を実行
      customerInfo = await Purchases.purchasePackage(package!);
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);

      // プログレスダイアログを閉じる
      Navigator.pop(context);

      // 購入がキャンセルされた場合は何もしない
      if (code == PurchasesErrorCode.purchaseCancelledError) {
        return;
      } else {
        // エラーダイアログを表示
        final message = exceptions.messageMap[exceptions.purchase];
        MyAlertDialog.showError(context, message!);
        return;
      }
    }

    // 購入情報を取得
    final entitlementInfo =
        customerInfo.entitlements.all[configs.entitlementId];

    // 購入に成功している場合
    if (entitlementInfo != null && entitlementInfo.isActive) {
      // バナー広告を非表示にする
      ref.read(isPurchasedProvider.notifier).state = true;

      // プログレスダイアログを閉じる
      Navigator.pop(context);
    }
  }
}
