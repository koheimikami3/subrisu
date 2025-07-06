import '../../../../importer.dart';

/// 通知に関する注意書きのテキスト
class NotificationNoticeText extends StatelessWidget {
  const NotificationNoticeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        NoticeText(
            text: AppLocalizations.of(context)!.notificationNoticePrefix),
        _notificationSettingsText(context),
        NoticeText(
            text: AppLocalizations.of(context)!.notificationNoticeSuffix),
      ],
    );
  }

  /// 通知設定を行うテキスト
  GestureDetector _notificationSettingsText(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // 端末の通知設定画面を開く
        await AppSettings.openAppSettings(
          type: AppSettingsType.notification,
        );
      },
      child: NoticeText(
        text: AppLocalizations.of(context)!.notificationNoticeSettings,
        isBold: true,
        color: Colors.blue,
      ),
    );
  }
}
