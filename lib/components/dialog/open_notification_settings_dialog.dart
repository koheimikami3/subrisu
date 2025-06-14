import '../../importer.dart';

/// 端末の通知設定画面を開く確認ダイアログ
class OpenNotificationSettingsDialog extends StatelessWidget {
  const OpenNotificationSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      content: AppLocalizations.of(context)!
          .showOpenNotificationSettingsDialogContent,
      actionText: AppLocalizations.of(context)!.openNotificationSettingsButton,
      isCaution: false,
      onPressed: () async {
        await AppSettings.openAppSettings(type: AppSettingsType.notification);
      },
    );
  }
}
