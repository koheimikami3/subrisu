import '../../../../constant/configs.dart' as configs;
import '../../../../constant/exceptions.dart' as exceptions;
import '../../../../constant/texts.dart' as texts;
import '../../../../importer.dart';

/// 購入処理を行う項目
class PurchaseItem extends ConsumerWidget {
  const PurchaseItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingItem(
      topItem: true,
      itemName: texts.removeAdsItem,
      leadingIcon: null,
      trailing: _price(ref),
      onTap: () => _onTap(context, ref),
    );
  }

  /// 価格を表示する
  Widget _price(WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Text(
      '¥320',
      style: TextStyle(
        color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
      ),
    );
  }

  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    late final Offerings offerings;
    late final Package? package;

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // RevenueCatでStateがCurrentになっているofferingを取得
      offerings = await Purchases.getOfferings();
      final offering = offerings.current;

      // 取得したofferingの存在チェック
      if (offering == null) {
        throw PlatformException(code: '');
      }

      // 購入するpackageを取得
      package = offering.lifetime;

      // 取得したpackageの存在チェック
      if (package == null) {
        throw PlatformException(code: '');
      }
    } on PlatformException {
      // プログレスダイアログを閉じる
      Navigator.pop(context);

      // エラーダイアログを表示
      final message = exceptions.messageMap[exceptions.noPurchaseItem];
      MyAlertDialog.showError(context, message!);
      return;
    }

    try {
      // 購入処理を実行
      final customerInfo = await Purchases.purchasePackage(package);

      // 購入情報を取得
      final entitlementInfo =
          customerInfo.entitlements.all[configs.entitlementId];

      // 購入に成功している場合
      if (entitlementInfo != null && entitlementInfo.isActive) {
        // バナー広告を非表示にする
        ref.read(isPurchasedProvider.notifier).state = true;

        // プログレスダイアログを閉じる
        Navigator.pop(context);

        // 完了ダイアログを表示
        const content = '購入が完了しました。';
        MyAlertDialog.showCompleted(context, content);
      }
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
      }
    }
  }
}
