import '../../../importer.dart';

/// ユーザー削除確認を行うダイアログ
class DeleteUserDialog extends ConsumerWidget {
  const DeleteUserDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = 'データ削除';
    const content = 'すべてのデータを削除してログアウトします。よろしいですか？';
    const actionText = '削除';

    return IOSConformDialog(
      title: title,
      content: content,
      actionText: actionText,
      onPressed: () async => await _onPressed(context, ref),
    );
  }

  /// ユーザーを削除し、ログイン画面に遷移する
  ///
  /// 今までの画面を全てウィジェットツリーから削除する
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final auth = FirebaseAuth.instance;
    final repository = ref.watch(userViewModelProvider.notifier);
    String err = '';

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // ユーザードキュメントを削除
      await repository.delete();

      // 認証ユーザーを削除
      await auth.currentUser!.delete();
    } catch (e) {
      err = e.toString();
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // ユーザー削除ダイアログを閉じる
    Navigator.pop(context);

    if (err != '') {
      IOSAlertDialog.show(context, true, err.toString());
      return;
    }

    // ログイン画面に遷移
    // 今までの画面を全てウィジェットツリーから削除
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }
}
