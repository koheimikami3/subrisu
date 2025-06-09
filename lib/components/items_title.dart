import 'package:subrisu/importer.dart';

/// 項目リストのタイトル
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
            _title(context, ref),
          ],
        ),
        SizedBox(height: 5.h),
      ],
    );
  }

  /// タイトル
  Widget _title(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);

    return Text(
      title,
      style: TextStyle(
        fontSize: 12.5.sp,
        color: selectColor(
          context: context,
          themeSetting: themeSetting,
          lightColor: Colors.grey.shade700,
          darkColor: Colors.grey.shade400,
        ),
      ),
    );
  }
}
