import '../../importer.dart';

/// 処理の実行中を知らせるダイアログを表示する
///
/// ダイアログは表示されたらユーザーの操作で閉じることができない
void showProgressDialog(BuildContext context) {
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
