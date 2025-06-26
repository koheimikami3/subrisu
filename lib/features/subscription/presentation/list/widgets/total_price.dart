import '../../../../../importer.dart';

/// 登録しているサブスクリプションの合計金額を示すテキスト
class TotalPrice extends ConsumerWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSubscriptions = ref.watch(subscriptionsProvider);
    final currencySettings = ref.watch(currencySettingsNotifierProvider);

    return asyncSubscriptions.when(
      loading: SizedBox.shrink,
      error: (_, __) => const SizedBox.shrink(),
      data: (subscriptions) {
        num totalPrice = 0; // 合計金額
        final now = DateTime.now();

        for (final subscription in subscriptions) {
          final price = subscription.price;
          final firstPaidOn = subscription.firstPaidOn.toDate();
          final paymentCycle = subscription.paymentCycle;
          int? paymentCycleMonths; // 支払い周期（月単位）

          // 初回支払日が現在より未来の場合はスキップ
          if (firstPaidOn.isAfter(now)) {
            continue;
          }

          // 支払い周期（月単位）を取得
          switch (paymentCycle) {
            case PaymentCycle.monthly:
              paymentCycleMonths = 1;
            case PaymentCycle.quarterly:
              paymentCycleMonths = 3;
            case PaymentCycle.semiAnnual:
              paymentCycleMonths = 6;
            case PaymentCycle.yearly:
              paymentCycleMonths = 12;
            case PaymentCycle.daily:
              paymentCycleMonths = null;
            case PaymentCycle.weekly:
              paymentCycleMonths = null;
          }

          // 支払い周期が月単位で設定されている場合、
          // 初回支払日から現在までの月数を計算し、今月が支払い月かどうかを判定
          // 支払い周期が日単位または週単位の場合は、今月の日数または週数を計算
          // 結果に応じて合計金額に加算
          if (paymentCycleMonths != null) {
            // 初回支払日から現在までの月数を計算
            final passedMonths = (now.year - firstPaidOn.year) * 12 +
                (now.month - firstPaidOn.month);

            // 今月が支払い月か判定
            final isPaymentMonth =
                passedMonths >= 0 && passedMonths % paymentCycleMonths == 0;

            // 今月が支払い月の場合のみ加算
            if (isPaymentMonth) {
              totalPrice += price;
            }
          } else if (paymentCycle == PaymentCycle.weekly) {
            // 今月の1日と最終日
            final firstDay = DateTime(now.year, now.month, 1);
            final lastDay = DateTime(now.year, now.month + 1, 0);

            // 今月が初回支払月か判定
            final isFirstPaidMonth =
                firstPaidOn.year == now.year && firstPaidOn.month == now.month;

            // 初回支払月の場合、初回支払日から月末までの週数分のみ加算
            // それ以外は全週分加算
            if (isFirstPaidMonth) {
              // 初回支払日が属する週番号（0〜）を計算
              final firstPaidWeek = ((firstPaidOn.day - 1) / 7).floor();
              final weeksInMonth =
                  ((lastDay.difference(firstDay).inDays + 1) / 7).ceil();

              // 初回支払日が属する週から月末までの週数のみ加算
              final weeksToAdd = weeksInMonth - firstPaidWeek;
              if (weeksToAdd > 0) {
                totalPrice += price * weeksToAdd;
              }
            } else {
              final weeksInMonth =
                  ((lastDay.difference(firstDay).inDays + 1) / 7).ceil();
              totalPrice += price * weeksInMonth;
            }
          } else if (paymentCycle == PaymentCycle.daily) {
            // 今月の最終日
            final lastDay = DateTime(now.year, now.month + 1, 0);

            // 今月が初回支払月か判定
            final isFirstPaidMonth =
                firstPaidOn.year == now.year && firstPaidOn.month == now.month;

            // 初回支払月の場合、初回支払日から月末までの日数分のみ加算
            // それ以外は全日分加算
            if (isFirstPaidMonth) {
              final daysToAdd = lastDay.day - firstPaidOn.day + 1;
              if (daysToAdd > 0) {
                totalPrice += price * daysToAdd;
              }
            } else {
              totalPrice += price * lastDay.day;
            }
          }
        }

        // 合計金額を通貨形式にフォーマット
        final totalText = AppLocalizations.of(context)!.total;
        final totalPriceText =
            currencySettings.formatAmount(totalPrice.toDouble());

        return Text('$totalText $totalPriceText');
      },
    );
  }
}
