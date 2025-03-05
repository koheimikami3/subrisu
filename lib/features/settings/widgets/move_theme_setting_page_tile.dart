import '../../../importer.dart';

/// テーマ設定画面に遷移するタイル
class MoveThemeSettingPageTile extends StatelessWidget {
  const MoveThemeSettingPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: ItemPosition.middle,
      name: AppLocalizations.of(context)!.themeItem,
      leadingIcon: Icons.dark_mode_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const ThemeSettingPage()),
        );
      },
    );
  }
}
