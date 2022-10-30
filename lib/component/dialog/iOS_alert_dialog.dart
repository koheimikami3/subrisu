import 'package:flutter/cupertino.dart';

/// iOS：実行結果を表示するダイアログ
class IOSAlertDialog {
  const IOSAlertDialog({Key? key});

  static void show(BuildContext context, bool isErr, String content) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: _title(isErr),
          content: Text(content),
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

    return Text(text);
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
