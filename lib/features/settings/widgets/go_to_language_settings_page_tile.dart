import '../../../importer.dart';

/// 言語設定画面に遷移するタイル
class GoToLanguageSettingsPageTile extends StatelessWidget {
  const GoToLanguageSettingsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.bottom,
      name: AppLocalizations.of(context)!.languageItem,
      leadingIcon: Icons.language_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const LanguageSettingsPage()),
        );
      },
    );
  }
}
