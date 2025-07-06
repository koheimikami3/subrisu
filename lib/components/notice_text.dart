import '../../../../importer.dart';

/// 注意書きのテキストウィジェット
class NoticeText extends ConsumerWidget {
  const NoticeText({
    super.key,
    required this.text,
    this.isBold = false,
    this.color,
  });

  final String text; // テキスト
  final bool isBold; // 太字にするかどうか
  final Color? color; // テキストカラー

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Text(
      text,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color ??
            selectColor(
              context: context,
              themeSettings: themeSettings,
              lightColor: Colors.grey.shade600,
              darkColor: Colors.grey.shade300,
            ),
      ),
    );
  }
}
