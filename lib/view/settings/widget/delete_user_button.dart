import 'package:flutter/cupertino.dart';

import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// ユーザー削除ダイアログを呼び出すボタン
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

  /// ユーザー削除ダイアログを呼び出す
  void _onPressed(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (_) => const DeleteUserDialog(),
    );
  }
}
