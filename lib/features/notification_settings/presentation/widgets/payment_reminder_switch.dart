import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// 支払いリマインド通知の有効/無効を切り替えるスイッチ
class PaymentReminderSwitch extends ConsumerWidget {
  const PaymentReminderSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(
      notificationSettingsPageNotifierProvider
          .select((state) => state.isEnabled),
    );

    return SizedBox(
      height: 15.h,
      child: CupertinoSwitch(
        value: isEnabled,
        activeTrackColor: AppColors.primary,
        onChanged: (value) {
          // 支払いリマインド通知の有効/無効を更新
          ref
              .read(notificationSettingsPageNotifierProvider.notifier)
              .setIsEnabled(value);
        },
      ),
    );
  }
}
