import '../../importer.dart';

/// 言語設定画面
class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.languageSettingsPageTitle),
      ),
      body: const LanguageSettingsPageBody(),
    );
  }
}
