import '../../../importer.dart';

/// 全サブスクリプションの削除確認を行うダイアログ
class DeleteAllSubscriptionsDialog extends ConsumerWidget {
  const DeleteAllSubscriptionsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = 'データ削除';
    const content = 'すべてのサブスクリプションデータを削除します。よろしいですか？';
    const actionText = '削除';

    return MyConformDialog(
      title: title,
      content: content,
      actionText: actionText,
      onPressed: () => _onPressed(context, ref),
    );
  }

  /// 全てのサブスクリプションデータを削除する
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final repository = ref.watch(subscriptionViewModelProvider.notifier);
    var err = '';

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // 全てのサブスクリプションを削除
      await repository.allDelete();
    } on Exception catch (e) {
      err = selectMessage(e.toString());
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // 全サブスクリプション削除ダイアログを閉じる
    Navigator.pop(context);

    // エラーが発生した場合、ダイアログを表示
    if (err != '') {
      MyAlertDialog.showError(context, err);
      return;
    }

    // 完了ダイアログを表示
    const text = '削除が完了しました。';
    MyAlertDialog.showCompleted(context, text);
  }
}
