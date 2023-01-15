import '../../../constant/colors.dart' as colors;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 課金画面のUIを作成する
class BillingPage extends ConsumerWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.billingPage),
      ),
      body: Material(
        color:
            isDark ? colors.darkBackgroundColor : colors.lightBackgroundColor,
        child: Row(
          children: [
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  SettingItem(
                    topItem: true,
                    itemName: texts.removeAdsItem,
                    leadingIcon: null,
                    trailing: _price(ref),
                    onTap: _onRemoveAdsTap,
                  ),
                  SettingItem(
                    bottomItem: true,
                    itemName: texts.restoreItem,
                    leadingIcon: null,
                    trailing: const SizedBox.shrink(),
                    onTap: _onRestoreTap,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      _supplement(ref),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }

  /// 価格を表示する
  Widget _price(WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Text(
      '¥320',
      style: TextStyle(
        color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
      ),
    );
  }

  /// 補足説明を表示する
  Widget _supplement(WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Text(
      '*広告の非表示は買い切りです。',
      style: TextStyle(
        color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
      ),
    );
  }

  Future<void> _onRemoveAdsTap() async {}

  Future<void> _onRestoreTap() async {}
}
