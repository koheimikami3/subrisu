import 'package:subrisu/core/next_payment_days_calculator.dart';

import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

/// サブスクリプションリスト
class SubscriptionList extends ConsumerWidget {
  const SubscriptionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final docList = ref.watch(subscriptionViewModelProvider);
    final sortIndex = ref.watch(listSortProvider);

    switch (sortIndex) {
      case 0:
        docList.sort((a, b) {
          final aDays = NextPaymentDaysCalculator.calculateDays(a);
          final bDays = NextPaymentDaysCalculator.calculateDays(b);

          return aDays.compareTo(bDays);
        });
      case 1:
        docList.sort((a, b) {
          final aPrice = int.parse(a.get('price') as String);
          final bPrice = int.parse(b.get('price') as String);

          return aPrice.compareTo(bPrice);
        });
      case 2:
        docList.sort((a, b) {
          final aPrice = int.parse(a.get('price') as String);
          final bPrice = int.parse(b.get('price') as String);

          return -aPrice.compareTo(bPrice);
        });
      case 3:
        docList.sort((a, b) {
          final aServiceName = a.get('serviceName') as String;
          final bServiceName = b.get('serviceName') as String;

          return aServiceName.compareTo(bServiceName);
        });
      case 4:
        docList.sort((a, b) {
          final aServiceName = a.get('serviceName') as String;
          final bServiceName = b.get('serviceName') as String;

          return -aServiceName.compareTo(bServiceName);
        });

      default:
        docList.sort((a, b) {
          final aDays = NextPaymentDaysCalculator.calculateDays(a);
          final bDays = NextPaymentDaysCalculator.calculateDays(b);

          return aDays.compareTo(bDays);
        });
    }

    return docList.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    colors.appColor,
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    Assets.images.subscription.subrisu.path,
                    height: 80.h,
                    width: 80.h,
                  ),
                ),
                _noData(),
              ],
            ),
          )
        : SingleChildScrollView(
            child: Row(
              children: [
                SizedBox(width: 20.w),
                Expanded(child: _list(docList)),
                SizedBox(width: 20.w),
              ],
            ),
          );
  }

  /// データ未登録時のテキスト
  Widget _noData() {
    const text = 'サブスクリプションはありません\n右下の＋ボタンで登録できます';

    return const Text(
      text,
      textAlign: TextAlign.center,
    );
  }

  /// リスト表示
  Widget _list(List<QueryDocumentSnapshot> docList) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: docList.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            if (index == 0) SizedBox(height: 20.h),
            SubscriptionItem(subscriptionDoc: docList[index]),
            SizedBox(height: 15.h),
            if (index == docList.length - 1) SizedBox(height: 50.h),
          ],
        );
      },
    );
  }
}
