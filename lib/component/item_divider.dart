import '../importer.dart';

/// 項目の境界線
class ItemDivider extends StatelessWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      color: Colors.grey.shade300,
    );
  }
}
