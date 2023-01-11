import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// サブスクリプションの更新を行うボタン
class UpdateButton extends ConsumerWidget {
  const UpdateButton({
    super.key,
    required this.subscriptionDoc,
  });

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceName = ref.watch(serviceNameProvider);
    final price = ref.watch(priceProvider);

    return MyCupertinoButton(
      text: texts.updateSubscriptionButton,
      onPressed: serviceName == '' || price == ''
          ? null
          : () => _onPressed(context, ref),
    );
  }

  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final repository = ref.watch(subscriptionViewModelProvider.notifier);
    final subscriptionId = subscriptionDoc.id;
    final timestamp = subscriptionDoc.get('createdAt') as Timestamp;
    final createdAt = timestamp.toDate();
    var err = '';

    // TextFieldのフォーカスを解除
    FocusScope.of(context).unfocus();

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // サブスクリプションを更新
      await repository.update(subscriptionId, createdAt);
    } on Exception catch (e) {
      err = selectMessage(e.toString());
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
