import '../../../importer.dart';

/// 端末の通知設定画面遷移の確認を行うダイアログを呼び出すタイル
class ShowOpenNotificationSettingsDialogTile extends StatelessWidget {
  const ShowOpenNotificationSettingsDialogTile({super.key});

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
