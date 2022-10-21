import 'package:subrisu/importer.dart';

/// 項目リストタイトルのUIを作成する
class ItemsTitle extends StatelessWidget {
  const ItemsTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title; // タイトル

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 15.w),
            _title(),
          ],
        ),
        SizedBox(height: 5.h),
      ],
    );
  }

  /// タイトルテキストを表示する
  Text _title() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 13.sp,
        color: Colors.grey.shade700,
      ),
    );
  }
}
