import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 更新を行うボタン
class UpdateButton extends ConsumerWidget {
  const UpdateButton({
    Key? key,
    required this.subscriptionDoc,
  }) : super(key: key);

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceName = ref.watch(serviceNameProvider);
    final price = ref.watch(priceProvider);

    return MyCupertinoButton(
      text: texts.updateSubscriptionButton,
      onPressed: serviceName == '' || price == ''
          ? null
          : () async => await _onPressed(context, ref),
    );
  }

  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final repository = ref.watch(subscriptionViewModelProvider.notifier);
    // final notification = ref.watch(notificationProvider);
    final subscriptionId = subscriptionDoc.id;
    final createdAt = subscriptionDoc.get('createdAt').toDate();
    int? notificationId;
    String err = '';

    // TextFieldのフォーカスを解除
    FocusScope.of(context).unfocus();

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      await NotificationScheduler.cancel(notificationId);

      // サブスクリプションを更新
      await repository.update(subscriptionId, createdAt);
    } catch (e) {
      err = ErrorHandler.selectMessage(e.toString());
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // エラーが発生した場合、ダイアログを表示
    if (err != '') {
      IOSAlertDialog.show(context, true, err);
      return;
    }

    // リスト画面に戻る
    Navigator.pop(context);
  }
}
