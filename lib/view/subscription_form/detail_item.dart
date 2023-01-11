import '../../importer.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final Widget content;

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
