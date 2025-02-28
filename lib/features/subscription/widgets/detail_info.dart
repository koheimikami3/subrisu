import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

/// サブスクリプションの詳細情報
class DetailInfo extends ConsumerWidget {
  const DetailInfo({
    super.key,
    this.paymentCycle,
    this.firstPaidOn,
  });

  final PaymentCycle? paymentCycle; // 支払い周期
  final DateTime? firstPaidOn; // 初回支払日

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);

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
              themeSetting: themeSetting,
              lightColor: Colors.white,
              darkColor: colors.darkItemColor,
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
                    FirstPaidOnForm(firstPaidOn: firstPaidOn),
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
