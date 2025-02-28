import '../../importer.dart';

/// 課金画面のScaffoldBody
class BillingPageBody extends ConsumerWidget {
  const BillingPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        const PurchaseItem(),
        const ItemDivider(),
        const RestoreItem(),
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
    final themeSetting = ref.watch(themeSettingNotifierProvider);

    return Text(
      AppLocalizations.of(context)!.billingSupplement,
      style: TextStyle(
        fontSize: 13.sp,
        color: selectColor(
          context: context,
          themeSetting: themeSetting,
          lightColor: Colors.grey.shade600,
          darkColor: Colors.grey.shade300,
        ),
      ),
    );
  }
}
