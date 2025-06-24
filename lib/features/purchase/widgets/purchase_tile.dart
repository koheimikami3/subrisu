import '../../../importer.dart';

/// 購入処理を行うタイル
class PurchaseTile extends ConsumerWidget {
  const PurchaseTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseStatus = ref.watch(purchaseStatusNotifierProvider);

    return MyListTile(
      position: TilePosition.top,
      name: AppLocalizations.of(context)!.removeAdsItem,
      trailing: _price(context, ref, purchaseStatus),
      onTap: () =>
          purchaseStatus == PurchaseStatus.active ? null : _onTap(context, ref),
    );
  }

  /// RevenueCatから取得した価格を表示する
  Widget _price(
    BuildContext context,
    WidgetRef ref,
    PurchaseStatus purchaseStatus,
  ) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);
    final asyncOfferings = ref.watch(offeringsProvider);

    return asyncOfferings.when(
      loading: _indicator,
      error: (_, __) => const SizedBox.shrink(),
      data: (offerings) {
        final offering = offerings.current;
        final package = offering!.lifetime;

        return Text(
          purchaseStatus == PurchaseStatus.active
              ? AppLocalizations.of(context)!.alreadyPurchased
              : package!.storeProduct.priceString,
          style: TextStyle(
            color: selectColor(
              context: context,
              themeSettings: themeSettings,
              lightColor: Colors.grey.shade600,
              darkColor: Colors.grey.shade300,
            ),
          ),
        );
      },
    );
  }

  /// 価格を取得中の際に表示するインジケーター
  CircularProgressIndicator _indicator() {
    return CircularProgressIndicator(
      strokeWidth: 2,
      constraints: BoxConstraints(
        minHeight: 13.h,
        minWidth: 13.h,
      ),
    );
  }

  /// 購入処理を実行する
  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    late final Offerings offerings;
    late final CustomerInfo customerInfo;

    // プログレスダイアログを表示
    showProgressDialog(context);

    try {
      // RevenueCatのofferingsを取得
      offerings = await ref.read(offeringsProvider.future);
    } on PlatformException {
      // プログレスダイアログを閉じる
      Navigator.pop(context);

      // エラーダイアログを表示
      showErrorDialog(
        context,
        AppLocalizations.of(context)!.noPurchaseItemError,
      );
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
        showErrorDialog(context, AppLocalizations.of(context)!.purchaseError);
        return;
      }
    }

    // 購入情報を取得
    final entitlementInfo =
        customerInfo.entitlements.all[Env.revenueCatEntitlementId];

    // 購入に成功している場合
    if (entitlementInfo != null && entitlementInfo.isActive) {
      // バナー広告を非表示にする
      ref.read(purchaseStatusNotifierProvider.notifier).setActive();

      // プログレスダイアログを閉じる
      Navigator.pop(context);
    }
  }
}
