import '../../../../constants/colors.dart' as colors;
import '../../../../importer.dart';

class IconSelectDialog extends ConsumerWidget {
  const IconSelectDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);

    return AlertDialog(
      insetPadding: EdgeInsets.all(20.w),
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: SizedBox(
        height: 550.h,
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
                color: selectColor(
                  context: context,
                  themeSetting: themeSetting,
                  lightColor: colors.appColor,
                  darkColor: colors.darkBackgroundColor,
                ),
              ),
              child: Stack(
                children: [
                  Center(child: _title(context)),
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
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        const Expanded(child: CommonIconList()),
                        SizedBox(height: 10.h),
                        // const Expanded(child: CommonIconList()),
                        SizedBox(height: 20.h),
                        _saveButton(context, ref),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  SizedBox(width: 15.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ダイアログのタイトルを表示する
  Widget _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.iconSelectDialogTitle,
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
    final selectedIconImagePath =
        ref.watch(subscriptionFormNotifierProvider).selectedIconImagePath;

    return MyFilledButton(
      text: AppLocalizations.of(context)!.saveIconButton,
      onPressed: selectedIconImagePath.isEmpty
          ? null
          : () {
              ref
                  .read(subscriptionFormNotifierProvider.notifier)
                  .setResultIconImagePath(selectedIconImagePath);

              Navigator.pop(context);
            },
    );
  }
}
