import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// カスタムAlertDialog
class MyAlertDialog {
  const MyAlertDialog();

  /// 実行完了を伝えるダイアログを表示する
  static void showCompleted(BuildContext context, String content) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(content),
          actions: [_closeButton(context)],
        );
      },
    );
  }

  /// エラー発生を伝えるダイアログを表示する
  static void showError(BuildContext context, String content) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(texts.errorDialogTitle),
          content: Text(content),
          actions: [_closeButton(context)],
        );
      },
    );
  }

  /// 閉じるボタン
  static Widget _closeButton(BuildContext context) {
    return TextButton(
      child: const Text(texts.closeDialogButton),
      onPressed: () => Navigator.pop(context),
    );
  }
}
