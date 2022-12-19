import '../../../importer.dart';

/// サブスクリプションの削除確認を行うダイアログ
class DeleteSubscriptionDialog extends ConsumerWidget {
  const DeleteSubscriptionDialog({
    Key? key,
    required this.subscriptionDoc,
  }) : super(key: key);

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = 'サブスクリプション削除';
    const content = 'データを削除してもよろしいですか？';
    const actionText = '削除';

    return IOSConformDialog(
      title: title,
      content: content,
      actionText: actionText,
      onPressed: () async => await _onPressed(context, ref),
    );
  }

  /// サブスクリプションを削除し、リスト画面に戻る
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final repository = ref.watch(subscriptionViewModelProvider.notifier);
    final notificationId = subscriptionDoc.get('notificationId');
    String err = '';

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // 通知をキャンセル
      await NotificationScheduler.cancel(notificationId);

      // サブスクリプションを削除
      await repository.delete(subscriptionDoc.id);
    } catch (e) {
      err = ErrorHandler.selectMessage(e.toString());
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // サブスクリプション削除ダイアログを閉じる
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
