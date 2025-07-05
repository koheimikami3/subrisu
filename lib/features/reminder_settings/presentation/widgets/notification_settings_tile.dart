import '../../../../importer.dart';

/// リマインダーを受け取るかどうかを設定するタイル
class NotificationSettingsTile extends StatelessWidget {
  const NotificationSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.top,
      name: AppLocalizations.of(context)!.reminder,
      trailing: const OpenNotificationSettingsSwitch(),
    );
  }
}
