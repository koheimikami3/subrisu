import 'package:subrisu/importer.dart';

/// 項目リストタイトルのUIを作成する
class ItemsTitle extends ConsumerWidget {
  const ItemsTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

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
    final isDark = ref.watch(darkModeProvider);
    Color color = Colors.grey.shade700;

    if (isDark) color = Colors.grey.shade400;

    return Text(
      title,
      style: TextStyle(
        fontSize: 12.5.sp,
        color: color,
      ),
    );
  }
}
