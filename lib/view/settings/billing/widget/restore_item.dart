import '../../../../constant/configs.dart' as configs;
import '../../../../constant/exceptions.dart' as exceptions;
import '../../../../constant/texts.dart' as texts;
import '../../../../importer.dart';

/// 復元処理を行う項目
class RestoreItem extends ConsumerWidget {
  const RestoreItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingItem(
      bottomItem: true,
      itemName: texts.restoreItem,
      leadingIcon: null,
      trailing: const SizedBox.shrink(),
      onTap: () => _onTap(context, ref),
    );
  }

  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // 過去の購入情報を取得
      final customerInfo = await Purchases.restorePurchases();
      final entitlementInfo =
          customerInfo.entitlements.all[configs.entitlementId];

      // 過去に購入している場合
      if (entitlementInfo != null && entitlementInfo.isActive) {
        // バナー広告を非表示にする
        ref.read(isPurchasedProvider.notifier).state = true;

        // プログレスダイアログを閉じる
        Navigator.pop(context);

        // 完了ダイアログを表示
        const content = '復元が完了しました。';
        MyAlertDialog.showCompleted(context, content);
      } else {
        // プログレスダイアログを閉じる
        Navigator.pop(context);

        // エラーダイアログを表示
        final message = exceptions.messageMap[exceptions.noPurchaseData];
        MyAlertDialog.showError(context, message!);
      }
    } on PlatformException {
      // プログレスダイアログを閉じる
      Navigator.pop(context);

      // エラーダイアログを表示
      final message = exceptions.messageMap[exceptions.restore];
      MyAlertDialog.showError(context, message!);
    }
  }
}
