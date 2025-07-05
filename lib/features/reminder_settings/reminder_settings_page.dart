import '../../importer.dart';

/// リマインダー設定画面
class ReminderSettingsPage extends StatelessWidget {
  const ReminderSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.reminderSettingsPageTitle),
      ),
      body: const ReminderSettingsPageBody(),
    );
  }
}
