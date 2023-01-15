import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

/// サブスクリプションリストのアイテムを表示する
class SubscriptionItem extends ConsumerWidget {
  const SubscriptionItem({
    super.key,
    required this.subscriptionDoc,
  });

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: isDark ? colors.darkItemColor : Colors.white,
      child: InkWell(
        onTap: () => _onTap(context),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
        child: SizedBox(
          height: 57.h,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(width: 15.w),
                    _iconImage(),
                    SizedBox(width: 15.w),
                    Expanded(child: _serviceName()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _price(),
                        _nextPaymentDate(),
                      ],
                    ),
                    SizedBox(width: 15.w),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }

  /// 編集画面に遷移する
  void _onTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => EditPage(subscriptionDoc: subscriptionDoc),
        fullscreenDialog: true,
      ),
    );
  }

  /// アイコン画像を表示する
  Widget _iconImage() {
    late String imagePath;
    imagePath = subscriptionDoc.get('iconImagePath') as String;

    if (imagePath == '') {
      imagePath = 'images/icon/squirrel.png';
    }

    return ColorFiltered(
      colorFilter: const ColorFilter.mode(colors.appColor, BlendMode.srcIn),
      child: Image.asset(
        imagePath,
        height: 40.h,
        width: 40.h,
      ),
    );
  }

  /// サービス名を表示する
  Widget _serviceName() {
    final serviceName = subscriptionDoc.get('serviceName') as String;

    return Text(
      serviceName,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// 料金を表示する
  Widget _price() {
    final price = subscriptionDoc.get('price');
    final text = '¥$price';

    return Text(
      text,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  /// 次回支払い日を表示する
  Widget _nextPaymentDate() {
    final data = subscriptionDoc.data()! as Map;
    final timestamp = data['firstPaidOn'] as Timestamp;
    final firstPaidOn = timestamp.toDate();
    final paymentCycle = data['paymentCycle'];
    var now = DateTime.now();
    now = DateTime(now.year, now.month, now.day);
    late final String text;

    switch (paymentCycle) {
      case 0:
        text = '今日';
        break;
      case 1:
        final nowWeekday = now.weekday;
        final firstWeekday = firstPaidOn.weekday;
        var day = firstWeekday - nowWeekday;
        if (day < 0) {
          day = day.abs();
          day = 7 - day;
        }

        if (nowWeekday == firstWeekday) {
          text = '今日';
        } else {
          text = 'あと$day日';
        }
        break;
      case 2:
        var nextPaidOn = DateTime(now.year, now.month, firstPaidOn.day);

        // 差分の日数を計算
        // マイナスになった場合はプラスに変換
        var difference = nextPaidOn.difference(now);
        var day = difference.inDays;
        if (day < 0) {
          nextPaidOn = DateTime(now.year, now.month + 1, firstPaidOn.day);
          difference = nextPaidOn.difference(now);
          day = difference.inDays;
        }

        if (day == 0) {
          text = '今日';
        } else {
          text = 'あと$day日';
        }
        break;
      case 3:
        var nextPaidOn = DateTime(now.year, firstPaidOn.month, firstPaidOn.day);

        // 差分の日数を計算
        // マイナスになった場合はプラスに変換
        var difference = nextPaidOn.difference(now);
        var day = difference.inDays;
        if (day < 0) {
          nextPaidOn =
              DateTime(now.year + 1, firstPaidOn.month, firstPaidOn.day);
          difference = nextPaidOn.difference(now);
          day = difference.inDays;
        }

        if (day == 0) {
          text = '今日';
        } else {
          text = 'あと$day日';
        }
        break;
    }

    return Text(
      text,
      style: TextStyle(
        color: text == '今日' ? Colors.red : null,
      ),
    );
  }
}
