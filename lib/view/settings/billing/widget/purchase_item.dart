import '../../../../constant/configs.dart' as configs;
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
      onTap: () => _onTap(context),
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

  Future<void> _onTap(BuildContext context) async {
    final offerings = await Purchases.getOfferings();
    final offering = offerings.current;

    if (offering != null) {
      final package = offering.lifetime;

      if (package != null) {
        // 購入処理を実行
        final customerInfo = await Purchases.purchasePackage(package);

        // 購入に成功したかチェック
        final isSucceeded =
            customerInfo.entitlements.all[configs.entitlementId]!.isActive;

        // 成功している場合、完了ダイアログを表示
        if (isSucceeded) {
          const content = '購入が完了しました。';
          MyAlertDialog.showCompleted(context, content);
        }
      }
    }
  }
}
