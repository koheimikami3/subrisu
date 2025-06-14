import '../../../../../importer.dart';

/// 次回支払日までの日数を表示する
///
/// 初回支払日と支払い周期から計算する
class NextPaymentDate extends StatelessWidget {
  const NextPaymentDate({
    super.key,
    required this.paymentCycle,
    required this.firstPaidDate,
  });

  final PaymentCycle paymentCycle; // 支払い周期
  final DateTime firstPaidDate; // 初回支払い日

  @override
  Widget build(BuildContext context) {
    late final String text;
    late int day;

    // 現在日付を取得
    var now = DateTime.now();
    now = DateTime(now.year, now.month, now.day);

    switch (paymentCycle) {
      case PaymentCycle.daily:
        text = AppLocalizations.of(context)!.today;

      case PaymentCycle.weekly:
        final nowWeekday = now.weekday;
        final firstWeekday = firstPaidDate.weekday;
        day = firstWeekday - nowWeekday;
        if (day < 0) {
          day = day.abs();
          day = 7 - day;
        }

        if (nowWeekday == firstWeekday) {
          text = AppLocalizations.of(context)!.today;
        } else {
          text = AppLocalizations.of(context)!.daysLeft(day);
        }

      case PaymentCycle.monthly:
        var nextPaidOn = firstPaidDate; // 次回支払日付
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

        if (day == 0) {
          text = AppLocalizations.of(context)!.today;
        } else {
          text = AppLocalizations.of(context)!.daysLeft(day);
        }

      case PaymentCycle.threeMonths:
        var nextPaidOn = firstPaidDate; // 次回支払日付
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

        if (day == 0) {
          text = AppLocalizations.of(context)!.today;
        } else {
          text = AppLocalizations.of(context)!.daysLeft(day);
        }

      case PaymentCycle.sixMonths:
        var nextPaidOn = firstPaidDate; // 次回支払日付
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

        if (day == 0) {
          text = AppLocalizations.of(context)!.today;
        } else {
          text = AppLocalizations.of(context)!.daysLeft(day);
        }

      case PaymentCycle.yearly:
        var nextPaidOn = firstPaidDate; // 次回支払日付
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

        if (day == 0) {
          text = AppLocalizations.of(context)!.today;
        } else {
          text = AppLocalizations.of(context)!.daysLeft(day);
        }
    }

    return Text(
      text,
      style: TextStyle(
        color: text == AppLocalizations.of(context)!.today
            ? Colors.red
            : day == 1
                ? Colors.orange.shade700
                : null,
      ),
    );
  }
}
