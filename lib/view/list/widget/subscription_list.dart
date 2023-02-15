import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

/// サブスクリプションリスト
class SubscriptionList extends ConsumerWidget {
  const SubscriptionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final docList = ref.watch(subscriptionViewModelProvider);

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
                  child: Image.asset('images/icon/subrisu.png'),
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
