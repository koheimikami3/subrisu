import '../../../importer.dart';

/// ユーザー削除確認を行うダイアログ
class DeleteUserDialog extends ConsumerWidget {
  const DeleteUserDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = 'データ削除';
    const content = 'すべてのデータを削除してログアウトします。よろしいですか？';
    const actionText = '削除';

    return IOSConformDialog(
      title: title,
      content: content,
      actionText: actionText,
      onPressed: () => _onPressed(context, ref),
    );
  }

  /// ユーザーを削除し、ログイン画面に遷移する
  ///
  /// 今までの画面を全てウィジェットツリーから削除する
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final auth = FirebaseAuth.instance;
    final repository = ref.watch(deletedUserViewModelProvider);
    var err = '';

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // 削除ユーザードキュメントを作成
      await repository.create();

      // Firebaseからサインアウト
      await auth.signOut();
    } on Exception catch (e) {
      err = selectMessage(e.toString());
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // ユーザー削除ダイアログを閉じる
    Navigator.pop(context);

    if (err != '') {
      IOSAlertDialog.show(context, true, err);
      return;
    }

    // ログイン画面に遷移
    // 今までの画面を全てウィジェットツリーから削除
    await Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }
}
