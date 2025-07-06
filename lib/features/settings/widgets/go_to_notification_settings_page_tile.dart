import '../../../importer.dart';

/// 通知設定画面に遷移するタイル
class GoToNotificationSettingsPageTile extends StatelessWidget {
  const GoToNotificationSettingsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.top,
      name: AppLocalizations.of(context)!.notificationItem,
      leadingIcon: Icons.notifications_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const NotificationSettingsPage(),
          ),
        );
      },
    );
  }
}
