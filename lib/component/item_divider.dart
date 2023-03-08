import '../importer.dart';

/// 項目の境界線
class ItemDivider extends ConsumerWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Container(
      height: 0.3.h,
      color: isDark ? Colors.grey.shade600 : Colors.black12,
    );
  }
}
