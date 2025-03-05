import '../../../../../constant/colors.dart' as colors;
import '../../../../../importer.dart';

/// アップデート内容を知らせるダイアログ
class UpdateContentsDialog extends ConsumerWidget {
  const UpdateContentsDialog({
    super.key,
    required this.version,
    required this.contents,
  });

  final String version; // バージョン
  final String contents; // アップデート内容

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
        height: 200.h,
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
              child: Center(child: _title(context)),
            ),
            Row(
              children: [
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Text(AppLocalizations.of(context)!.newVersion(version)),
                      SizedBox(height: 10.h),
                      Text(contents),
                      SizedBox(height: 20.h),
                      Text(AppLocalizations.of(context)!.thankYouMessage),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
          ],
        ),
      ),
      actions: [
        _closeButton(context, ref),
      ],
    );
  }

  /// ダイアログのタイトルを表示する
  Widget _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.updateContentsDialogTitle,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _closeButton(BuildContext context, WidgetRef ref) {
    return MyFilledButton(
      text: AppLocalizations.of(context)!.closeDialogButton,
      onPressed: () => Navigator.pop(context),
    );
  }
}
