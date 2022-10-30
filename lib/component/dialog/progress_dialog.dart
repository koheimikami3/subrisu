import '../../importer.dart';

/// データ処理の実行中を知らせるダイアログ
///
/// ダイアログは表示されたらユーザーの操作で閉じることができない
class ProgressDialog {
  const ProgressDialog({Key? key});

  static void show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      pageBuilder: (_, __, ___) {
        return const SafeArea(
          child: LoadingIndicator(),
        );
      },
    );
  }
}
