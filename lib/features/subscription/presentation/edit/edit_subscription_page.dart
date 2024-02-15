import '../../../../constant/texts.dart' as texts;
import '../../../../importer.dart';

/// サブスクリプション編集画面
class EditSubscriptionPage extends ConsumerStatefulWidget {
  const EditSubscriptionPage({
    super.key,
    required this.subscription,
  });

  final Subscription subscription; // サブスクリプション

  @override
  ConsumerState<EditSubscriptionPage> createState() =>
      _EditSubscriptionPageState();
}

class _EditSubscriptionPageState extends ConsumerState<EditSubscriptionPage> {
  @override
  void initState() {
    super.initState();

    // 画面描画後に処理を実行
    // フォームに初期値を設定
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(subscriptionFormNotifierProvider.notifier).initFormState(
            serviceName: widget.subscription.serviceName,
            price: widget.subscription.price,
            iconImagePath: widget.subscription.iconImagePath,
            paymentCycle: widget.subscription.paymentCycle,
            firstPaidOn: widget.subscription.firstPaidOn.toDate(),
            notification: widget.subscription.notification,
            memo: widget.subscription.serviceName,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(texts.editSubscriptionPage),
          actions: [
            Row(
              children: [
                ShowDeleteSubscriptionDialogButton(
                  subscriptionId: widget.subscription.id,
                ),
                SizedBox(width: 20.w),
              ],
            ),
          ],
        ),
        body: EditSubscriptionPageBody(subscription: widget.subscription),
      ),
    );
  }
}
