import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 編集画面のUIを作成する
class EditPage extends ConsumerStatefulWidget {
  const EditPage({
    Key? key,
    required this.subscriptionDoc,
  }) : super(key: key);

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  ConsumerState<EditPage> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final data = widget.subscriptionDoc.data() as Map;

      ref.watch(serviceNameProvider.notifier).state = data['serviceName'];
      ref.watch(priceProvider.notifier).state = data['price'];
      ref.watch(resultIconImagePathProvider.notifier).state =
          data['iconImagePath'];
      ref.watch(paymentCycleProvider.notifier).state = data['paymentCycle'];
      ref.watch(firstPaidOnProvider.notifier).state =
          data['firstPaidOn'].toDate();
      ref.watch(notificationProvider.notifier).state = data['notification'];
      ref.watch(memoProvider.notifier).state = data['memo'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.subscriptionDoc.data() as Map;
    final serviceName = data['serviceName'];
    final price = data['price'];
    final paymentCycle = data['paymentCycle'];
    final firstPaidOn = data['firstPaidOn'].toDate();

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
          button: UpdateButton(subscriptionDoc: widget.subscriptionDoc),
        ),
      ),
    );
  }
}
