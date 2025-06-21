import '../../../constants/configs.dart' as configs;
import '../../../importer.dart';

/// 復元処理を行うタイル
class RestoreTile extends ConsumerWidget {
  const RestoreTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyListTile(
      position: ItemPosition.bottom,
      name: AppLocalizations.of(context)!.restoreItem,
      trailing: const SizedBox.shrink(),
      onTap: () => _onTap(context, ref),
    );
  }

  /// 復元処理を実行する
  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    // プログレスダイアログを表示
    showProgressDialog(context);

    try {
      // 過去の購入情報を取得
      final customerInfo = await Purchases.restorePurchases();
      final entitlementInfo =
          customerInfo.entitlements.all[configs.entitlementId];

      // 過去に購入している場合
      if (entitlementInfo != null && entitlementInfo.isActive) {
        // バナー広告を非表示にする
        ref.read(purchaseStatusNotifierProvider.notifier).setActive();

        // プログレスダイアログを閉じる
        Navigator.pop(context);

        // 完了ダイアログを表示
        showCompletedDialog(
          context,
          AppLocalizations.of(context)!.restoreCompletedDialogContent,
        );
      } else {
        // プログレスダイアログを閉じる
        Navigator.pop(context);

        // エラーダイアログを表示
        showErrorDialog(
          context,
          AppLocalizations.of(context)!.noPurchaseInfoError,
        );
      }
    } on PlatformException {
      // プログレスダイアログを閉じる
      Navigator.pop(context);

      // エラーダイアログを表示
      showErrorDialog(context, AppLocalizations.of(context)!.restoreError);
    }
  }
}
