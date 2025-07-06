import '../../../importer.dart';

/// 通知設定画面のScaffoldBody
class NotificationSettingsPageBody extends ConsumerWidget {
  const NotificationSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSettings = ref.watch(paymentReminderSettingsProvider);

    return asyncSettings.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
      data: (settings) {
        // 画面描画後に処理を実行
        // フォームに初期値を設定
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(notificationSettingsPageNotifierProvider.notifier).initState(
                isEnabled: settings.isEnabled,
                daysBefore: settings.daysBefore,
                hour: settings.hour,
              );
        });

        return Column(
          children: [
            SizedBox(height: 25.h),
            const PaymentReminderSwitchTile(),
            const ItemDivider(),
            const PaymentReminderDaysBeforeTile(),
            const ItemDivider(),
            const PaymentReminderHourTile(),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 15.w),
                const Expanded(child: NotificationNoticeText()),
                SizedBox(width: 15.w),
              ],
            ),
          ],
        );
      },
    );
  }
}
