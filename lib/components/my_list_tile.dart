import '../constants/colors.dart' as colors;
import '../importer.dart';

/// カスタムListTile
class MyListTile extends ConsumerWidget {
  const MyListTile({
    super.key,
    required this.position,
    required this.name,
    this.leadingIcon,
    this.trailing,
    this.onTap,
  });

  final TilePosition position; // タイルの配置位置
  final String name; // 項目名
  final IconData? leadingIcon; // 前方アイコン
  final Widget? trailing; // 後方コンテンツ
  final VoidCallback? onTap; // ボタンタップ時の動作

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Material(
      color: selectColor(
        context: context,
        themeSettings: themeSettings,
        lightColor: Colors.white,
        darkColor: colors.darkItemColor,
      ),
      shape: position == TilePosition.independence
          ? Border(
              top: BorderSide(color: Colors.grey.shade400),
              bottom: BorderSide(color: Colors.grey.shade400),
            )
          : position == TilePosition.top
              ? Border(top: BorderSide(color: Colors.grey.shade400))
              : position == TilePosition.bottom
                  ? Border(bottom: BorderSide(color: Colors.grey.shade400))
                  : null,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(width: 15.w),
            if (leadingIcon != null)
              Row(
                children: [
                  Icon(
                    leadingIcon,
                    size: 20.w,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 11.h),
                  Row(
                    children: [
                      Expanded(child: Text(name)),
                      SizedBox(width: 3.w),
                      trailing == null
                          ? Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.grey.shade500,
                            )
                          : trailing!,
                      SizedBox(width: 15.w),
                    ],
                  ),
                  SizedBox(height: 11.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
