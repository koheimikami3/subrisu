import '../../importer.dart';

/// 実行確認を行うダイアログ
class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
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
  final bool isCaution; //　実行ボタンテキストを赤色にするかどうか
  final VoidCallback onPressed; // 実行ボタン押下時の動作

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        _cancelButton(context),
        _actionButton(),
      ],
    );
  }

  /// キャンセルボタン
  Widget _cancelButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(AppLocalizations.of(context)!.cancelButton),
    );
  }

  /// 実行ボタン
  Widget _actionButton() {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        actionText,
        style: TextStyle(color: isCaution ? Colors.red : null),
      ),
    );
  }
}
