import 'package:subrisu/importer.dart';

/// 項目リストタイトルのUIを作成する
class ItemsTitle extends ConsumerWidget {
  const ItemsTitle({
    super.key,
    required this.title,
  });

  final String title; // タイトル

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 15.w),
            _title(ref),
          ],
        ),
        SizedBox(height: 5.h),
      ],
    );
  }

  /// タイトルテキストを表示する
  Text _title(WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeNotifierProvider);
    var color = Colors.grey.shade700;

    if (isDarkMode) {
      color = Colors.grey.shade400;
    }

    return Text(
      title,
      style: TextStyle(
        fontSize: 12.5.sp,
        color: color,
      ),
    );
  }
}
