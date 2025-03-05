import '../../../importer.dart';

/// 言語設定画面に遷移するタイル
class MoveLanguageSettingPageTile extends StatelessWidget {
  const MoveLanguageSettingPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: ItemPosition.bottom,
      name: AppLocalizations.of(context)!.languageItem,
      leadingIcon: Icons.language_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const LanguageSettingPage()),
        );
      },
    );
  }
}
