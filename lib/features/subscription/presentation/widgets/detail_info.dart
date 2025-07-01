import '../../../../importer.dart';

/// サブスクリプションの詳細情報
class DetailInfo extends ConsumerWidget {
  const DetailInfo({
    super.key,
    this.paymentCycle,
  });

  final PaymentCycle? paymentCycle; // 支払い周期

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.detailInfoTitle),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey.shade400),
            color: selectColor(
              context: context,
              themeSettings: themeSettings,
              lightColor: Colors.white,
              darkColor: AppColors.darkItem,
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  children: [
                    PaymentCycleSelectionForm(paymentCycle: paymentCycle),
                    const ItemDivider(),
                    const FirstPaidOnForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
