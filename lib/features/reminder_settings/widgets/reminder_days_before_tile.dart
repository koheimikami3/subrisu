import '../../../importer.dart';

/// リマインダーの「支払い日の何日前に通知するか」を設定するタイル
class ReminderDaysBeforeTile extends ConsumerWidget {
  const ReminderDaysBeforeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.reminderDaysBeforeTitle,
      trailing: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.reminderDaysBefore(1.toString()),
            ),
            Icon(
              Icons.unfold_more,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
