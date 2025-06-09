import '../../importer.dart';

/// 実行完了を伝えるAlertDialogを表示する
void showCompletedDialog(BuildContext context, String content) {
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

/// エラー発生を伝えるAlertDialogを表示する
void showErrorDialog(BuildContext context, String content) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.errorDialogTitle),
        content: Text(content),
        actions: [_closeButton(context)],
      );
    },
  );
}

/// AlertDialogを閉じるボタン
Widget _closeButton(BuildContext context) {
  return TextButton(
    child: Text(AppLocalizations.of(context)!.closeDialogButton),
    onPressed: () => Navigator.pop(context),
  );
}
