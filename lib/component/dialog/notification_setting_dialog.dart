import '../../importer.dart';

/// 端末の通知設定画面の遷移確認を行うダイアログ
class NotificationSettingDialog extends ConsumerWidget {
  const NotificationSettingDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = '確認';
    const content = '支払い前日に通知を受け取るには、アプリの通知設定をオンにする必要があります。';
    const actionText = '設定する';

    return const MyConformDialog(
      title: title,
      content: content,
      actionText: actionText,
      isCaution: false,
      onPressed: AppSettings.openNotificationSettings,
    );
  }
}
