import '../../../../../importer.dart';

/// 設定画面に遷移するボタン
class MoveSettingsPageButton extends StatelessWidget {
  const MoveSettingsPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const SettingsPage(),
            fullscreenDialog: true,
          ),
        );
      },
      icon: Icon(
        Icons.settings,
        size: 23.h,
      ),
    );
  }
}
