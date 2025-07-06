import '../../../importer.dart';

/// 通知設定画面
class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.notificationSettingsPageTitle),
      ),
      body: const NotificationSettingsPageBody(),
    );
  }
}
