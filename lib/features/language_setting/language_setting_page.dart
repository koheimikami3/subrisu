import '../../importer.dart';

/// 言語設定画面
class LanguageSettingPage extends StatelessWidget {
  const LanguageSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.languageSettingPageTitle),
      ),
      body: const LanguageSettingPageBody(),
    );
  }
}
