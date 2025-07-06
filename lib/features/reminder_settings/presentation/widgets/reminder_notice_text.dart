import '../../../../importer.dart';

/// リマインド通知に関する注意書きのテキスト
class ReminderNoticeText extends StatelessWidget {
  const ReminderNoticeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        NoticeText(text: AppLocalizations.of(context)!.reminderNoticePrefix),
        _notificationSettingsText(context),
        NoticeText(text: AppLocalizations.of(context)!.reminderNoticeSuffix),
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
        text: AppLocalizations.of(context)!.reminderNoticeSettings,
        isBold: true,
        color: Colors.blue,
      ),
    );
  }
}
