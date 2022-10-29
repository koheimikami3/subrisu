import '../constant/configs.dart' as configs;
import '../importer.dart';

/// 設定項目のUIを作成する
class SettingItem extends ConsumerWidget {
  const SettingItem({
    Key? key,
    this.independenceItem = false,
    this.topItem = false,
    this.middleItem = false,
    this.bottomItem = false,
    required this.itemName,
    this.leadingIcon,
    this.trailing = const ArrowIcon(),
    required this.onTap,
  }) : super(key: key);

  final bool independenceItem; // 独立項目か
  final bool topItem; // リスト最上部項目か
  final bool middleItem; // リスト中間項目か
  final bool bottomItem; // リスト最下部項目か
  final String itemName; // 項目名
  final IconData? leadingIcon; // 前方アイコン
  final Widget trailing; // 後方コンテンツ
  final VoidCallback? onTap; // ボタンタップ時の動作

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Material(
      borderRadius: independenceItem
          ? _independenceRadius()
          : topItem
              ? _topRadius()
              : middleItem
                  ? null
                  : bottomItem
                      ? _bottomRadius()
                      : null,
      color: isDark ? configs.darkItemColor : Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: independenceItem
            ? _independenceRadius()
            : topItem
                ? _topRadius()
                : middleItem
                    ? null
                    : bottomItem
                        ? _bottomRadius()
                        : null,
        highlightColor: Colors.black26,
        splashFactory: NoSplash.splashFactory,
        child: Row(
          children: [
            SizedBox(width: 15.w),
            if (leadingIcon != null)
              Row(
                children: [
                  _leadingIcon(),
                  SizedBox(width: 10.w),
                ],
              ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 10.w),
                  Row(
                    children: [
                      Expanded(child: Text(itemName)),
                      trailing,
                      SizedBox(width: 15.w),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  if (topItem || middleItem) _divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 独立した項目の丸み
  BorderRadius _independenceRadius() => BorderRadius.circular(10);

  /// リスト最上部項目の丸み
  BorderRadius _topRadius() {
    return const BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    );
  }

  /// リスト最下部項目の丸み
  BorderRadius _bottomRadius() {
    return const BorderRadius.only(
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
    );
  }

  /// 前方アイコンを表示する
  Icon _leadingIcon() {
    return Icon(
      leadingIcon,
      size: 21,
    );
  }

  /// 項目境界線を表示する
  Container _divider() {
    return Container(
      height: 0.5.h,
      color: Colors.black12,
    );
  }
}
