import 'package:flutter/cupertino.dart';
import 'package:subrisu/importer.dart';

/// ユーザー削除を行うボタン
class DeleteUserButton extends ConsumerWidget {
  const DeleteUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      onPressed: () => _onPressed(context, ref),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          SizedBox(width: 5.w),
          _text(),
        ],
      ),
    );
  }

  /// アイコンを表示する
  Icon _icon() {
    return const Icon(
      Icons.delete_outline,
      color: Colors.red,
    );
  }

  /// テキストを表示する
  Text _text() {
    return const Text(
      Texts.deleteUserButton,
      style: TextStyle(color: Colors.red),
    );
  }

  /// ユーザーを削除し、ログイン画面に遷移する
  ///
  /// 今までの画面を全てウィジェットツリーから削除する
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final auth = FirebaseAuth.instance;
    final repository = ref.watch(userViewModelProvider);
    final userId = ref.watch(userIdProvider);

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    // ユーザーデータを削除
    await repository.delete(userId);

    // 匿名ユーザーを削除
    auth.currentUser!.delete();

    // プログレスダイアログを閉じる
    // ignore: use_build_context_synchronously
    Navigator.pop(context);

    // ログイン画面に遷移
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }
}
