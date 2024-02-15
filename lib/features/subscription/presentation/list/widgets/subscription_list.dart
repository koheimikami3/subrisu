import '../../../../../importer.dart';

/// サブスクリプションリスト
class SubscriptionList extends ConsumerWidget {
  const SubscriptionList({
    super.key,
    required this.subscriptions,
  });

  final List<Subscription> subscriptions; // サブスクリプションリスト

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptionSort = ref.watch(subscriptionSortNotifierProvider);

    switch (subscriptionSort) {
      case SubscriptionSort.ascendingNextPaymentDays:
        subscriptions.sort((a, b) {
          final aDays = NextPaymentDaysCalculator.calculateDays(a);
          final bDays = NextPaymentDaysCalculator.calculateDays(b);
          return aDays.compareTo(bDays);
        });
      case SubscriptionSort.ascendingPrice:
        subscriptions.sort((a, b) {
          return int.parse(a.price).compareTo(int.parse(b.price));
        });
      case SubscriptionSort.descendingPrice:
        subscriptions.sort((a, b) {
          return -int.parse(a.price).compareTo(int.parse(b.price));
        });
      case SubscriptionSort.ascendingServiceName:
        subscriptions.sort((a, b) {
          return a.serviceName.compareTo(b.serviceName);
        });
      case SubscriptionSort.descendingServiceName:
        subscriptions.sort((a, b) {
          return -a.serviceName.compareTo(b.serviceName);
        });
    }

    return ListView.separated(
      // shrinkWrap: true,
      itemCount: subscriptions.length,
      separatorBuilder: (_, __) => SizedBox(height: 15.h),
      itemBuilder: (_, index) {
        return Column(
          children: [
            if (index == 0) SizedBox(height: 20.h),
            SubscriptionItem(subscription: subscriptions[index]),
            if (index == subscriptions.length - 1) SizedBox(height: 50.h),
          ],
        );
      },
    );
  }
}
