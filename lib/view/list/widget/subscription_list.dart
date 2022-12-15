import '../../../importer.dart';

/// リスト画面のUIを作成する
class SubscriptionList extends ConsumerWidget {
  const SubscriptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptionDocList = ref.watch(subscriptionViewModelProvider);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: subscriptionDocList.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            if (index == 0) SizedBox(height: 20.h),
            SubscriptionItem(subscriptionDoc: subscriptionDocList[index]),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }
}
