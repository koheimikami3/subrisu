import '../../../../../importer.dart';

/// サブリス画像
class SubrisuImage extends StatelessWidget {
  const SubrisuImage({
    super.key,
    required this.color,
  });

  final Color color; // 塗りつぶす色

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
      child: Image.asset(
        Assets.images.subscription.subrisu.path,
        height: 80.h,
        width: 80.h,
      ),
    );
  }
}
