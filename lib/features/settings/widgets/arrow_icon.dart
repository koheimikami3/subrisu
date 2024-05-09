import 'package:subrisu/importer.dart';

/// 矢印アイコン
class ArrowIcon extends StatelessWidget {
  const ArrowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios,
      size: 17,
      color: Colors.grey.shade500,
    );
  }
}
