import '../../../../importer.dart';

/// リマインド通知に関する注意書きのテキスト
class ReminderNoticeText extends ConsumerWidget {
  const ReminderNoticeText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Wrap(
      children: [
        Text(
          AppLocalizations.of(context)!.reminderNoticePrefix,
          style: TextStyle(
            fontSize: 13.sp,
            color: selectColor(
              context: context,
              themeSettings: themeSettings,
              lightColor: Colors.grey.shade600,
              darkColor: Colors.grey.shade300,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await AppSettings.openAppSettings(
              type: AppSettingsType.notification,
            );
          },
          child: Text(
            AppLocalizations.of(context)!.reminderNoticeSettings,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.reminderNoticeSuffix,
          style: TextStyle(
            fontSize: 13.sp,
            color: selectColor(
              context: context,
              themeSettings: themeSettings,
              lightColor: Colors.grey.shade600,
              darkColor: Colors.grey.shade300,
            ),
          ),
        ),
      ],
    );
  }
}
