import '../../importer.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    Key? key,
    required this.title,
    required this.content,
    this.active = true,
  }) : super(key: key);

  final String title;
  final Widget content;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            _title(),
            const Spacer(),
            content,
            SizedBox(width: 15.w),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  /// 項目のタイトルを表示する
  Widget _title() {
    return Text(
      title,
      style: active ? null : const TextStyle(color: Colors.black38),
    );
  }
}
