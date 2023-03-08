import '../../../constant/exceptions.dart' as exceptions;
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

    // 変更を正常に監視するために処理を行う
    ref.watch(memoProvider);

    return MyCupertinoButton(
      text: texts.updateSubscriptionButton,
      onPressed: serviceName == '' || price == ''
          ? null
          : () => _onPressed(context, ref),
    );
  }

  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final repository = ref.read(subscriptionViewModelProvider.notifier);
    final subscriptionId = subscriptionDoc.id;
    final timestamp = subscriptionDoc.get('createdAt') as Timestamp;
    final createdAt = timestamp.toDate();
    var message = '';

    // TextFieldのフォーカスを解除
    FocusScope.of(context).unfocus();

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // サブスクリプションを更新
      await repository.update(subscriptionId, createdAt);
    } on Exception {
      message = exceptions.messageMap[exceptions.updateSubscription]!;
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // 例外が発生した場合、エラーダイアログを表示
    if (message != '') {
      MyAlertDialog.showError(context, message);
      return;
    }

    // リスト画面に戻る
    Navigator.pop(context);
  }
}
