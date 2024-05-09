import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 設定画面
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(texts.settingsPageTitle)),
      body: const SettingsPageBody(),
    );
  }
}
