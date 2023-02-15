import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

/// アイコン画像選択ダイアログを呼び出すボタン
class IconSelectButton extends ConsumerWidget {
  const IconSelectButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconImagePath = ref.watch(resultIconImagePathProvider);

    //「icon_list」で初期値を反映できるようにこちらで監視する
    ref.watch(selectIconImagePathProvider);

    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (_) => const IconSelectDialog(),
        );
      },
      child: iconImagePath == ''
          ? DottedBorder(
              padding: EdgeInsets.zero,
              color: colors.appColor,
              borderType: BorderType.Circle,
              dashPattern: const [8, 4],
              child: SizedBox(
                height: 60.h,
                width: 60.h,
                child: const Icon(
                  Icons.add,
                  color: colors.appColor,
                ),
              ),
            )
          : Container(
              height: 60.h,
              width: 60.h,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                border: Border.all(color: colors.appColor),
                shape: BoxShape.circle,
              ),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(colors.appColor, BlendMode.srcIn),
                child: Image.asset(iconImagePath),
              ),
            ),
    );
  }
}
