import '../../importer.dart';

/// テーマ設定画面
class ThemeSettingPage extends StatelessWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.themeSettingPageTitle),
      ),
      body: const ThemeSettingPageBody(),
    );
  }
}
