import '../../importer.dart';

/// 端末の通知設定画面遷移の確認を行うダイアログ
class OpenNotificationSettingsDialog extends StatelessWidget {
  const OpenNotificationSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    const title = '確認';
    const content = '支払い前日に通知を受け取るには、アプリの通知設定をオンにする必要があります。';
    const actionText = '設定する';

    return ConfirmationDialog(
      title: title,
      content: content,
      actionText: actionText,
      isCaution: false,
      onPressed: () async {
        await AppSettings.openAppSettings(type: AppSettingsType.notification);
      },
    );
  }
}
