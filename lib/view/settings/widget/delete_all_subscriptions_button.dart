import 'package:flutter/cupertino.dart';

import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 全サブスクリプション削除ダイアログを呼び出すボタン
class DeleteAllSubscriptionsButton extends StatelessWidget {
  const DeleteAllSubscriptionsButton({super.key});

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

  /// 全サブスクリプション削除ダイアログを呼び出す
  void _onPressed(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (_) => const DeleteAllSubscriptionsDialog(),
    );
  }

  /// アイコンを表示する
  Icon _icon() {
    return Icon(
      CupertinoIcons.delete,
      size: 16.h,
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
}
