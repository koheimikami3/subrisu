import '../../../../../importer.dart';

/// 登録しているサブスクリプションの合計金額を示すテキスト
class TotalPrice extends ConsumerWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSubscriptions = ref.watch(subscriptionsProvider);

    return asyncSubscriptions.when(
      loading: SizedBox.shrink,
      error: (_, __) => const SizedBox.shrink(),
      data: (subscriptions) {
        var totalPrice = 0; // 合計金額

        for (final subscription in subscriptions) {
          final price = int.parse(subscription.price);

          // 現在日付を取得
          var now = DateTime.now();
          now = DateTime(now.year, now.month, now.day);

          // 初回支払日を取得
          final firstPaidOn = subscription.firstPaidOn.toDate();

          // 今月の1日の日付を取得
          final firstDay = DateTime(now.year, now.month, 1);

          // 今月の最終日の日付を取得
          final lastDay = DateTime(now.year, now.month + 1, 0);

          switch (subscription.paymentCycle) {
            case PaymentCycle.daily:
              var dateTime = firstDay;

              // 今月の日数分料金を加算
              for (var i = 0; i < lastDay.day; i++) {
                totalPrice += price;
              }

              // 今月加入したサービスの場合、
              // 加入前の日数分料金を引く
              while (dateTime.isBefore(firstPaidOn)) {
                dateTime = DateTime(
                  dateTime.year,
                  dateTime.month,
                  dateTime.day + 1,
                );
                totalPrice -= price;
              }

            case PaymentCycle.weekly:
              // 今月の週数を計算
              final weeksInMonth =
                  ((lastDay.difference(firstDay).inDays) / 7).ceil();

              // 今月の週数分料金を加算
              for (var i = 0; i < weeksInMonth; i++) {
                totalPrice += price;
              }

            case PaymentCycle.monthly:
              totalPrice += price;

            case PaymentCycle.threeMonths:
              totalPrice += price ~/ 3;

            case PaymentCycle.sixMonths:
              totalPrice += price ~/ 6;

            case PaymentCycle.yearly:
              totalPrice += price ~/ 12;
          }
        }
        return Text('${AppLocalizations.of(context)!.total}$totalPrice');
      },
    );
  }
}
