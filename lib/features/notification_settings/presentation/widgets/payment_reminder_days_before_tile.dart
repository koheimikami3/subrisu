import 'package:flutter/material.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/notification_settings/presentation/widgets/select_payment_reminder_days_before_button.dart';
import 'package:subrisu/l10n/app_localizations.dart';

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
