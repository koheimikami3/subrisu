import 'package:flutter/cupertino.dart';

/// iOS：実行結果を表示するダイアログ
class MyAlertDialog {
  const MyAlertDialog();

  static void showCompleted(BuildContext context, String content) {
    const text = '実行結果';

    showCupertinoDialog<void>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(text),
          content: Text(content),
          actions: [_closeButton(context)],
        );
      },
    );
  }

  static void showError(BuildContext context, String content) {
    const text = 'エラー';

    showCupertinoDialog<void>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(text),
          content: Text(content),
          actions: [_closeButton(context)],
        );
      },
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
