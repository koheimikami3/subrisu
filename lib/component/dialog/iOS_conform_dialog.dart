import 'package:flutter/cupertino.dart';

import '../../importer.dart';

class IOSConformDialog extends StatelessWidget {
  const IOSConformDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actionText,
    required this.onPressed,
  });

  final String title; // タイトル
  final String content; // 内容
  final String actionText; // 実行ボタンテキスト
  final VoidCallback onPressed; // 実行ボタン押下時の動作

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        _cancelButton(context),
        _actionButton(),
      ],
    );
  }

  /// キャンセルボタンを表示する
  CupertinoDialogAction _cancelButton(BuildContext context) {
    const text = 'キャンセル';

    return CupertinoDialogAction(
      onPressed: () => Navigator.pop(context),
      child: const Text(text),
    );
  }

  /// 実行ボタンを表示する
  CupertinoDialogAction _actionButton() {
    return CupertinoDialogAction(
      onPressed: onPressed,
      child: Text(
        actionText,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
