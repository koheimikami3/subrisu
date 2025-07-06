import '../../../importer.dart';

/// 言語設定画面のScaffoldBody
class ReminderSettingsPageBody extends ConsumerWidget {
  const ReminderSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSettings = ref.watch(reminderSettingsProvider);

    return asyncSettings.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
      data: (settings) {
        // 画面描画後に処理を実行
        // フォームに初期値を設定
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(reminderSettingsPageNotiferProvider.notifier).initState(
                isEnabled: settings.isEnabled,
                daysBefore: settings.daysBefore,
                hour: settings.hour,
              );
        });

        return Column(
          children: [
            SizedBox(height: 25.h),
            const NotificationSettingsTile(),
            const ItemDivider(),
            const ReminderDaysBeforeTile(),
            const ItemDivider(),
            const ReminderHourTile(),
          ],
        );
      },
    );
  }
}
