import '../../importer.dart';

/// 設定画面
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context)!.settingsPageTitle)),
      body: const Column(
        children: [
          Expanded(child: SettingsPageBody()),
          MyBannerAd(),
        ],
      ),
    );
  }
}
