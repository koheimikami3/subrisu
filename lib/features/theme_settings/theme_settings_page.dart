import '../../importer.dart';

/// テーマ設定画面
class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.themeSettingsPageTitle),
      ),
      body: const ThemeSettingsPageBody(),
    );
  }
}
