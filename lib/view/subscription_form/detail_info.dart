import '../../constant/colors.dart' as colors;
import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 詳細情報を表示する
class DetailInfo extends ConsumerWidget {
  const DetailInfo({
    super.key,
    this.paymentCycle,
    this.firstPaidOn,
  });

  final int? paymentCycle;
  final DateTime? firstPaidOn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Column(
      children: [
        const ItemsTitle(title: texts.detailInfoTitle),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isDark ? colors.darkItemColor : Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  children: [
                    PaymentCycleForm(paymentCycle: paymentCycle),
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
