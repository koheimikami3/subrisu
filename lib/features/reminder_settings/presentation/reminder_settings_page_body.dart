import '../../../importer.dart';

/// 言語設定画面のScaffoldBody
class ReminderSettingsPageBody extends StatelessWidget {
  const ReminderSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        const NotificationSettingsTile(),
        const ItemDivider(),
        const ReminderDaysBeforeTile(),
        const ItemDivider(),
        const ReminderHourTile(),
      ],
    );
  }
}
