import 'package:flutter/cupertino.dart';

import '../../importer.dart';

class MyConformDialog extends StatelessWidget {
  const MyConformDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actionText,
    this.isCaution = true,
    required this.onPressed,
  });

  final String title; // タイトル
  final String content; // 内容
  final String actionText; // 実行ボタンテキスト
  final bool isCaution; //　実行ボタンテキストを赤色にするか
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
        style: TextStyle(color: isCaution ? Colors.red : null),
      ),
    );
  }
}
