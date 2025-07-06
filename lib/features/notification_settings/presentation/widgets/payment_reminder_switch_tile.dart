import '../../../../importer.dart';

/// 支払いリマインド通知のタイル
class PaymentReminderSwitchTile extends StatelessWidget {
  const PaymentReminderSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.top,
      name: AppLocalizations.of(context)!.reminder,
      trailing: const PaymentReminderSwitch(),
    );
  }
}
