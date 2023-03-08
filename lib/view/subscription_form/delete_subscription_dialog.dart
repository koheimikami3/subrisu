import '../../constant/exceptions.dart' as exceptions;
import '../../importer.dart';

/// サブスクリプションの削除確認を行うダイアログ
class DeleteSubscriptionDialog extends ConsumerWidget {
  const DeleteSubscriptionDialog({
    super.key,
    required this.subscriptionDoc,
  });

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = '確認';
    const content = 'データを削除してもよろしいですか？';
    const actionText = '削除';

    return MyConformDialog(
      title: title,
      content: content,
      actionText: actionText,
      onPressed: () => _onPressed(context, ref),
    );
  }

  /// サブスクリプションを削除し、リスト画面に戻る
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final repository = ref.read(subscriptionViewModelProvider.notifier);
    var message = '';

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // サブスクリプションを削除
      await repository.delete(subscriptionDoc.id);
    } on Exception {
      message = exceptions.messageMap[exceptions.deleteSubscription]!;
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // サブスクリプション削除ダイアログを閉じる
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
