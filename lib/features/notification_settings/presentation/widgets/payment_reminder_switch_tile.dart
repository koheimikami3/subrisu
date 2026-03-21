import 'package:flutter/material.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/notification_settings/presentation/widgets/payment_reminder_switch.dart';
import 'package:subrisu/l10n/app_localizations.dart';

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
