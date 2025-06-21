import '../../importer.dart';

/// 課金画面のScaffoldBody
class PurchasePageBody extends ConsumerWidget {
  const PurchasePageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        const PurchaseTile(),
        const ItemDivider(),
        const RestoreTile(),
        SizedBox(height: 10.h),
        Row(
          children: [
            SizedBox(width: 15.w),
            _supplement(context, ref),
          ],
        ),
      ],
    );
  }

  /// 補足説明
  Widget _supplement(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Text(
      AppLocalizations.of(context)!.purchaseSupplement,
      style: TextStyle(
        fontSize: 13.sp,
        color: selectColor(
          context: context,
          themeSettings: themeSettings,
          lightColor: Colors.grey.shade600,
          darkColor: Colors.grey.shade300,
        ),
      ),
    );
  }
}
