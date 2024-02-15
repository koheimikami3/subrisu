import '../../../constant/colors.dart' as colors;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// サブスクリプションの詳細情報
class DetailInfo extends ConsumerWidget {
  const DetailInfo({
    super.key,
    this.paymentCycle,
    this.firstPaidOn,
  });

  final int? paymentCycle; // 支払い周期
  final DateTime? firstPaidOn; // 初回支払日

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeNotifierProvider);

    return Column(
      children: [
        const ItemsTitle(title: texts.detailInfoTitle),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isDarkMode ? colors.darkItemColor : Colors.white,
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
