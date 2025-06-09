import '../../../../importer.dart';

/// 詳細情報フォームの共通化クラス
class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.title,
    required this.content,
  });

  final String title; // 項目名
  final Widget content; // 内容

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(title),
            const Spacer(),
            content,
            SizedBox(width: 15.w),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
