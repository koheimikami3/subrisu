import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:subrisu/components/dialog/my_alert_dialog.dart';
import 'package:subrisu/components/dialog/progress_dialog.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/env/env.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/purchase_status_provider.dart';

/// 復元処理を行うタイル
class RestoreTile extends ConsumerWidget {
  const RestoreTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyListTile(
      position: TilePosition.bottom,
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
          customerInfo.entitlements.all[Env.revenueCatEntitlementId];

      if (!context.mounted) {
        return;
      }

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
      if (!context.mounted) {
        return;
      }

      // プログレスダイアログを閉じる
      Navigator.pop(context);

      // エラーダイアログを表示
      showErrorDialog(context, AppLocalizations.of(context)!.restoreError);
    }
  }
}
