import '../../../importer.dart';

/// 端末の通知設定画面を開く確認ダイアログを表示するタイル
class OpenNotificationSettingsTile extends StatelessWidget {
  const OpenNotificationSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: ItemPosition.top,
      name: AppLocalizations.of(context)!.notificationItem,
      leadingIcon: Icons.notifications_outlined,
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (_) => const OpenNotificationSettingsDialog(),
        );
      },
    );
  }
}
