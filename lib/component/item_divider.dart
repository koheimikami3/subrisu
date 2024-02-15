import '../importer.dart';

/// 項目の境界線
class ItemDivider extends ConsumerWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeNotifierProvider);

    return Container(
      height: 0.3.h,
      color: isDarkMode ? Colors.grey.shade600 : Colors.black12,
    );
  }
}
