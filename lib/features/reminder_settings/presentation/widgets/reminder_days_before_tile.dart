import '../../../../importer.dart';

/// リマインダーの「何日前に通知するか」を設定するタイル
class ReminderDaysBeforeTile extends StatelessWidget {
  const ReminderDaysBeforeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.reminderDaysBeforeTitle,
      trailing: const SelecetDaysBeforeButton(),
    );
  }
}
