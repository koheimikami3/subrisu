import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 課金画面
class BillingPage extends ConsumerWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.billingPage),
      ),
      body: Row(
        children: [
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 25.h),
                const PurchaseItem(),
                const RestoreItem(),
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
    );
  }

  /// 補足説明
  Widget _supplement(WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Text(
      '*広告の非表示は買い切りです。',
      style: TextStyle(
        fontSize: 13.sp,
        color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
      ),
    );
  }
}
