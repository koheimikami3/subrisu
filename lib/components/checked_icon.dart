import '../importer.dart';

/// 項目が選択済みであることを示すアイコン
class CheckedIcon extends StatelessWidget {
  const CheckedIcon({
    super.key,
    required this.isChecked,
  });

  final bool isChecked; // 選択済みであるかどうか

  @override
  Widget build(BuildContext context) {
    return isChecked
        ? const Icon(
            Icons.check,
            size: 22,
            color: AppColors.primary,
          )
        : const SizedBox.shrink();
  }
}
