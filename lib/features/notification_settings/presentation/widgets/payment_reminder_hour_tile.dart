import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/notification_settings/presentation/widgets/select_payment_reminder_hour_button.dart';
import 'package:subrisu/l10n/app_localizations.dart';

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
