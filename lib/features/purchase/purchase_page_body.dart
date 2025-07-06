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
            NoticeText(text: AppLocalizations.of(context)!.purchaseNotice),
          ],
        ),
      ],
    );
  }
}
