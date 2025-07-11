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
    final sortOrder = ref.watch(subscriptionSortOrderNotifierProvider);

    switch (sortOrder) {
      case SubscriptionSortOrder.nextPaymentAsc:
        subscriptions.sort((a, b) {
          final aDays = _calculateNextPaymentDays(a);
          final bDays = _calculateNextPaymentDays(b);
          return aDays.compareTo(bDays);
        });
      case SubscriptionSortOrder.priceAsc:
        subscriptions.sort((a, b) {
          return a.price.compareTo(b.price);
        });
      case SubscriptionSortOrder.priceDesc:
        subscriptions.sort((a, b) {
          return -a.price.compareTo(b.price);
        });
      case SubscriptionSortOrder.serviceNameAsc:
        subscriptions.sort((a, b) {
          return a.serviceName.compareTo(b.serviceName);
        });
      case SubscriptionSortOrder.serviceNameDesc:
        subscriptions.sort((a, b) {
          return -a.serviceName.compareTo(b.serviceName);
        });
    }

    return ListView.separated(
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

  /// 次回支払日までの日数を計算する
  int _calculateNextPaymentDays(Subscription subscription) {
    final paymentCycle = subscription.paymentCycle;
    var day = 0;

    // 現在日付を取得
    var now = DateTime.now();
    now = DateTime(now.year, now.month, now.day);

    // 初回支払日を取得
    final firstPaidOn = subscription.firstPaidOn.toDate();

    switch (paymentCycle) {
      case PaymentCycle.daily:
        day = 0;

      case PaymentCycle.weekly:
        final nowWeekday = now.weekday;
        final firstWeekday = firstPaidOn.weekday;
        day = firstWeekday - nowWeekday;
        if (day < 0) {
          day = day.abs();
          day = 7 - day;
        }

      case PaymentCycle.biweekly:
        var nextPaidOn = firstPaidOn;
        const daysToAdd = 14; // 加える日数

        // 次回支払日付を作成
        // 今日より後の日付になるまで
        // 初回支払日付を初期値として14日ずつ加える
        while (nextPaidOn.isBefore(now)) {
          nextPaidOn = nextPaidOn.add(const Duration(days: daysToAdd));
        }

        // 今日と次回の支払日付の差分の日数を計算
        final difference = nextPaidOn.difference(now);
        day = difference.inDays;

      case PaymentCycle.monthly:
        var nextPaidOn = firstPaidOn; // 次回支払日付
        const month = 1; // 加える月数

        // 次回支払日付を作成
        // 今日より後の日付になるまで
        // 初回支払日付を初期値として1ヶ月ずつ加える
        while (nextPaidOn.isBefore(now)) {
          nextPaidOn = DateTime(
            nextPaidOn.year,
            nextPaidOn.month + month,
            nextPaidOn.day,
          );
        }

        // 今日と次回の支払日付の差分の日数を計算
        final difference = nextPaidOn.difference(now);
        day = difference.inDays;

      case PaymentCycle.quarterly:
        var nextPaidOn = firstPaidOn; // 次回支払日付
        const month = 3; // 加える月数

        // 次回支払日付を作成
        // 今日より後の日付になるまで
        // 初回支払日付を初期値として3ヶ月ずつ加える
        while (nextPaidOn.isBefore(now)) {
          nextPaidOn = DateTime(
            nextPaidOn.year,
            nextPaidOn.month + month,
            nextPaidOn.day,
          );
        }

        // 今日と次回の支払日付の差分の日数を計算
        final difference = nextPaidOn.difference(now);
        day = difference.inDays;

      case PaymentCycle.semiAnnual:
        var nextPaidOn = firstPaidOn; // 次回支払日付
        const month = 6; // 加える月数

        // 次回支払日付を作成
        // 今日より後の日付になるまで
        // 初回支払日付を初期値として6ヶ月ずつ加える
        while (nextPaidOn.isBefore(now)) {
          nextPaidOn = DateTime(
            nextPaidOn.year,
            nextPaidOn.month + month,
            nextPaidOn.day,
          );
        }

        // 今日と次回の支払日付の差分の日数を計算
        final difference = nextPaidOn.difference(now);
        day = difference.inDays;

      case PaymentCycle.yearly:
        var nextPaidOn = firstPaidOn; // 次回支払日付
        const year = 1; // 加える月数

        // 次回支払日付を作成
        // 今日より後の日付になるまで
        // 初回支払日付を初期値として1年ずつ加える
        while (nextPaidOn.isBefore(now)) {
          nextPaidOn = DateTime(
            nextPaidOn.year + year,
            nextPaidOn.month,
            nextPaidOn.day,
          );
        }

        // 今日と次回の支払日付の差分の日数を計算
        final difference = nextPaidOn.difference(now);
        day = difference.inDays;
    }
    return day;
  }
}
