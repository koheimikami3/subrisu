import '../../../importer.dart';

/// テーマ設定画面に遷移するタイル
class GoToThemeSettingsPageTile extends StatelessWidget {
  const GoToThemeSettingsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.themeItem,
      leadingIcon: Icons.dark_mode_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const ThemeSettingsPage()),
        );
      },
    );
  }
}
