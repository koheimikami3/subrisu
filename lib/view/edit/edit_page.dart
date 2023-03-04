import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 編集画面のUIを作成する
class EditPage extends ConsumerStatefulWidget {
  const EditPage({
    super.key,
    required this.subscriptionDoc,
  });

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  ConsumerState<EditPage> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  late String serviceName; // サービス名
  late String price; // 料金
  late String iconImagePath; // アイコン画像パス
  late int paymentCycle; // 支払い周期
  late DateTime firstPaidOn; // 初回支払い日
  late bool notification; // 通知設定
  late String memo; // メモ

  @override
  void initState() {
    super.initState();

    // SubscriptionDocument内のデータを取得
    final data = widget.subscriptionDoc.data()! as Map;
    serviceName = data['serviceName'] as String;
    price = data['price'] as String;
    iconImagePath = data['iconImagePath'] as String;
    paymentCycle = data['paymentCycle'] as int;
    final timestamp = data['firstPaidOn'] as Timestamp;
    firstPaidOn = timestamp.toDate();
    notification = data['notification'] as bool;
    memo = data['memo'] as String;

    // 取得したデータを各プロバイダの初期値として保存
    // 例外が発生しないように画面描画後に処理を実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(serviceNameProvider.notifier).state = serviceName;
      ref.read(priceProvider.notifier).state = price;
      ref.read(selectIconImagePathProvider.notifier).state = iconImagePath;
      ref.read(resultIconImagePathProvider.notifier).state = iconImagePath;
      ref.read(paymentCycleProvider.notifier).state = paymentCycle;
      ref.read(firstPaidYearProvider.notifier).state = firstPaidOn.year;
      ref.read(firstPaidMonthProvider.notifier).state = firstPaidOn.month;
      ref.read(firstPaidDayProvider.notifier).state = firstPaidOn.day;
      ref.read(notificationProvider.notifier).state = notification;
      ref.read(memoProvider.notifier).state = memo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(texts.editPage),
          actions: [
            Row(
              children: [
                DeleteSubscriptionButton(
                  subscriptionDoc: widget.subscriptionDoc,
                ),
                SizedBox(width: 20.w),
              ],
            )
          ],
        ),
        body: SubscriptionForm(
          subscriptionDoc: widget.subscriptionDoc,
          serviceName: serviceName,
          price: price,
          paymentCycle: paymentCycle,
          firstPaidOn: firstPaidOn,
          memo: memo,
          button: UpdateButton(subscriptionDoc: widget.subscriptionDoc),
        ),
      ),
    );
  }
}
