import 'package:flutter/cupertino.dart';

import '../../importer.dart';

/// iOS用の実行結果を表示するダイアログ
class IOSAlertDialog {
  const IOSAlertDialog({Key? key});

  static void show(BuildContext context, bool isErr, String content) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: _title(isErr),
          content: _content(content),
          actions: [_closeButton(context)],
        );
      },
    );
  }

  /// タイトルを表示する
  static Text _title(bool isErr) {
    late final String text;

    if (isErr) text = 'エラー';
    if (!isErr) text = '実行結果';

    return Text(
      text,
      style: TextStyle(fontSize: 15.sp),
    );
  }

  /// 内容を表示する
  static Text _content(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 14.sp),
    );
  }

  /// 閉じるボタンを表示する
  static CupertinoDialogAction _closeButton(BuildContext context) {
    const text = '閉じる';

    return CupertinoDialogAction(
      child: const Text(text),
      onPressed: () => Navigator.pop(context),
    );
  }
}
