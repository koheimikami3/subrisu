import 'package:subrisu/component/circular_indicator.dart';
import 'package:subrisu/importer.dart';

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
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.7),
                ),
                child: const CircularIndicator(),
              ),
            ],
          ),
        );
      },
    );
  }
}
