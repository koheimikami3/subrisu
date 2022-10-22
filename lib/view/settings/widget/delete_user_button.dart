import 'package:flutter/cupertino.dart';
import 'package:subrisu/importer.dart';

/// ユーザー削除を行うボタン
class DeleteUserButton extends StatelessWidget {
  const DeleteUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => _onPressed(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          SizedBox(width: 12.w),
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

  /// ログイン画面に遷移する
  ///
  /// 今までの画面を全てウィジェットツリーから削除する
  void _onPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }
}
