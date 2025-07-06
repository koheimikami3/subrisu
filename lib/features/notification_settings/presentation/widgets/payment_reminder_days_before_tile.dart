import '../../../../importer.dart';

/// 支払いリマインダーの「何日前に通知するか」を設定するタイル
class PaymentReminderDaysBeforeTile extends StatelessWidget {
  const PaymentReminderDaysBeforeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.reminderDaysBeforeTitle,
      trailing: const SelectPaymentReminderDaysBeforeButton(),
    );
  }
}
