import '../../../importer.dart';

/// 次回支払日までの日数を表示する
///
/// 初回支払日と支払い周期から計算する
class NextPaymentDate extends ConsumerWidget {
  const NextPaymentDate({
    super.key,
    required this.subscriptionDoc,
  });

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = subscriptionDoc.data()! as Map<String, dynamic>;
    final paymentCycle = data['paymentCycle'];
    late final String text;
    late int day;
    const today = '今日';

    // 現在日付を取得
    var now = DateTime.now();
    now = DateTime(now.year, now.month, now.day);

    // 初回支払日を取得
    final timestamp = data['firstPaidOn'] as Timestamp;
    final firstPaidOn = timestamp.toDate();

    switch (paymentCycle) {
      // 「毎日」の場合
      case 0:
        text = today;

        break;

      // 「毎週」の場合
      case 1:
        final nowWeekday = now.weekday;
        final firstWeekday = firstPaidOn.weekday;
        day = firstWeekday - nowWeekday;
        if (day < 0) {
          day = day.abs();
          day = 7 - day;
        }

        if (nowWeekday == firstWeekday) {
          text = today;
        } else {
          text = 'あと$day日';
        }

        break;

      // 「毎月」の場合
      case 2:
        // 今月の初回支払日付を作成
        var nextPaidOn = DateTime(now.year, now.month, firstPaidOn.day);

        // 差分の日数を計算
        // マイナスになった場合はプラスに変換
        var difference = nextPaidOn.difference(now);
        day = difference.inDays;
        if (day < 0) {
          nextPaidOn = DateTime(now.year, now.month + 1, firstPaidOn.day);
          difference = nextPaidOn.difference(now);
          day = difference.inDays;
        }

        if (day == 0) {
          text = today;
        } else {
          text = 'あと$day日';
        }

        break;

      // 「毎月」の場合
      case 3:
        // 今月の初回支払日付に3ヶ月加えた日付を作成
        var nextPaidOn = DateTime(now.year, now.month + 3, firstPaidOn.day);

        // 差分の日数を計算
        // マイナスになった場合はプラスに変換
        var difference = nextPaidOn.difference(now);
        day = difference.inDays;
        if (day < 0) {
          nextPaidOn = DateTime(now.year, now.month + 1, firstPaidOn.day);
          difference = nextPaidOn.difference(now);
          day = difference.inDays;
        }

        if (day == 0) {
          text = today;
        } else {
          text = 'あと$day日';
        }
        break;

      // 「6ヶ月」の場合
      case 4:
        // 今月の初回支払日付に6ヶ月加えた日付を作成
        var nextPaidOn = DateTime(now.year, now.month + 6, firstPaidOn.day);

        // 差分の日数を計算
        // マイナスになった場合はプラスに変換
        var difference = nextPaidOn.difference(now);
        day = difference.inDays;
        if (day < 0) {
          nextPaidOn = DateTime(now.year, now.month + 1, firstPaidOn.day);
          difference = nextPaidOn.difference(now);
          day = difference.inDays;
        }

        if (day == 0) {
          text = today;
        } else {
          text = 'あと$day日';
        }
        break;

      // 「毎年」の場合
      case 5:
        var nextPaidOn = DateTime(now.year, firstPaidOn.month, firstPaidOn.day);

        // 差分の日数を計算
        // マイナスになった場合はプラスに変換
        var difference = nextPaidOn.difference(now);
        day = difference.inDays;
        if (day < 0) {
          nextPaidOn =
              DateTime(now.year + 1, firstPaidOn.month, firstPaidOn.day);
          difference = nextPaidOn.difference(now);
          day = difference.inDays;
        }

        if (day == 0) {
          text = today;
        } else {
          text = 'あと$day日';
        }
    }

    return Text(
      text,
      style: TextStyle(
        color: text == today
            ? Colors.red
            : day == 1
                ? Colors.orange.shade800
                : null,
      ),
    );
  }
}
