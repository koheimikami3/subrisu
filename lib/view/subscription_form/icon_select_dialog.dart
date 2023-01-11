import '../../constant/colors.dart' as colors;
import '../../constant/texts.dart' as texts;
import '../../importer.dart';

class IconSelectDialog extends ConsumerWidget {
  const IconSelectDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return AlertDialog(
      insetPadding: EdgeInsets.all(20.w),
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: SizedBox(
        height: 500.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: isDark ? colors.darkBackgroundColor : colors.appColor,
              ),
              child: Stack(
                children: [
                  Center(child: _title()),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _closeButton(context),
                        SizedBox(width: 15.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        const Expanded(child: IconList()),
                        SizedBox(height: 20.h),
                        _saveButton(context, ref),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ダイアログのタイトルを表示する
  Widget _title() {
    const text = 'アイコン選択';

    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  /// ダイアログを閉じるボタン
  Widget _closeButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.clear,
        color: Colors.white,
      ),
    );
  }

  /// アイコン画像を保存するボタン
  Widget _saveButton(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(selectIconImagePathProvider);

    return MyCupertinoButton(
      text: texts.saveIconButton,
      onPressed: imagePath == ''
          ? null
          : () {
              ref.watch(resultIconImagePathProvider.notifier).state = imagePath;

              Navigator.pop(context);
            },
    );
  }
}
