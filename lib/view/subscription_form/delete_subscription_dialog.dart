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
    const content = 'サブスクリプションデータを削除してもよろしいですか？';
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
    var err = '';

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // サブスクリプションを削除
      await repository.delete(subscriptionDoc.id);
    } on Exception catch (e) {
      err = selectMessage(e.toString());
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // サブスクリプション削除ダイアログを閉じる
    Navigator.pop(context);

    // エラーが発生した場合、ダイアログを表示
    if (err != '') {
      MyAlertDialog.showError(context, err);
      return;
    }

    // リスト画面に戻る
    Navigator.pop(context);
  }
}
