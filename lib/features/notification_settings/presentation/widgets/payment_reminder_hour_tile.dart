import '../../../../importer.dart';

/// 支払いリマインダーの「何時に通知するか」を設定するタイル
class PaymentReminderHourTile extends ConsumerWidget {
  const PaymentReminderHourTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyListTile(
      position: TilePosition.bottom,
      name: AppLocalizations.of(context)!.reminderHourTitle,
      trailing: const SelectPaymentReminderHourButton(),
    );
  }
}
