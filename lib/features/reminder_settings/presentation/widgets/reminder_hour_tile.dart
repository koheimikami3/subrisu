import '../../../../importer.dart';

/// リマインダーの「何時に通知するか」を設定するタイル
class ReminderHourTile extends ConsumerWidget {
  const ReminderHourTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyListTile(
      position: TilePosition.bottom,
      name: AppLocalizations.of(context)!.reminderHourTitle,
      trailing: const SelectHourButton(),
    );
  }
}
