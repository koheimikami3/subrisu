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
            // 「毎日」の場合
            case 0:
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

            // 「毎週」の場合
            case 1:
              // 今月の週数を計算
              final weeksInMonth =
                  ((lastDay.difference(firstDay).inDays) / 7).ceil();

              // 今月の週数分料金を加算
              for (var i = 0; i < weeksInMonth; i++) {
                totalPrice += price;
              }

            // 「毎月」の場合
            case 2:
              totalPrice += price;

            // 「3ヶ月」の場合
            case 3:
              totalPrice += price ~/ 3;

            // 「6ヶ月」の場合
            case 4:
              totalPrice += price ~/ 6;

            // 「毎年」の場合
            case 5:
              totalPrice += price ~/ 12;
          }
        }

        return Text('今月の合計：¥$totalPrice');
      },
    );
  }
}
