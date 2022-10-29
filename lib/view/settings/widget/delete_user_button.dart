import 'package:flutter/cupertino.dart';
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// ユーザー削除を行うボタン
class DeleteUserButton extends ConsumerWidget {
  const DeleteUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      onPressed: () async => await _onPressed(context, ref),
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
    return Text(
      texts.deleteUserButton,
      style: TextStyle(
        fontSize: 15.sp,
        color: Colors.red,
      ),
    );
  }

  /// ユーザーを削除し、ログイン画面に遷移する
  ///
  /// 今までの画面を全てウィジェットツリーから削除する
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final auth = FirebaseAuth.instance;
    final repository = ref.watch(userViewModelProvider.notifier);

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // ユーザードキュメントを削除
      await repository.delete();
    } catch (e) {
      Navigator.pop(context);
      IOSAlertDialog.show(context, true, e.toString());
      return;
    }

    // 認証ユーザーを削除
    auth.currentUser!.delete();

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // ログイン画面に遷移
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }
}
