import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

/// 項目を選択していることを示すアイコン
class CheckIcon extends StatelessWidget {
  const CheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check,
      size: 22,
      color: colors.appColor,
    );
  }
}
