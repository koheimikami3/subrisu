import '../../../../../constant/exceptions.dart' as exceptions;
import '../../../../../importer.dart';

/// サブスクリプション削除の確認を行うダイアログ
class DeleteSubscriptionDialog extends ConsumerWidget {
  const DeleteSubscriptionDialog({
    super.key,
    required this.subscriptionId,
  });

  final String subscriptionId; // サブスクリプションID

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

  /// サブスクリプションを削除してサブスクリプション一覧画面に戻る
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    String? errorMessge; // エラーメッセージ

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // サブスクリプションを削除
      await ref.read(deleteSubscriptionProvider(subscriptionId).future);
    } on Exception {
      // エラーメッセージを取得
      errorMessge = exceptions.messageMap[exceptions.deleteSubscription];
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // サブスクリプション削除ダイアログを閉じる
    Navigator.pop(context);

    // 例外が発生した場合、エラーダイアログを表示
    if (errorMessge != null) {
      MyAlertDialog.showError(context, errorMessge);
      return;
    }

    // サブスクリプション一覧画面に戻る
    Navigator.pop(context);
  }
}
