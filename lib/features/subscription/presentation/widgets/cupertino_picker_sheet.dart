import '../../../../constants/colors.dart' as colors;
import '../../../../importer.dart';

class CupertinoPickerSheet extends ConsumerWidget {
  const CupertinoPickerSheet({
    super.key,
    required this.picker,
    required this.saveOnPressed,
  });

  final Widget picker;
  final VoidCallback saveOnPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);

    return Container(
      height: 200.h,
      color: selectColor(
        context: context,
        themeSetting: themeSetting,
        lightColor: Colors.white,
        darkColor: colors.darkItemColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10.w),
              _cancelButton(context, themeSetting),
              const Spacer(),
              _saveButton(context),
              SizedBox(width: 10.w),
            ],
          ),
          Expanded(child: picker),
        ],
      ),
    );
  }

  /// 変更をキャンセルしてPickerを閉じるボタン
  Widget _cancelButton(BuildContext context, ThemeSetting themeSetting) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        AppLocalizations.of(context)!.cancelButton,
        style: TextStyle(
          fontSize: 15.5.sp,
          color: selectColor(
            context: context,
            themeSetting: themeSetting,
            lightColor: Colors.grey.shade800,
            darkColor: Colors.white,
          ),
        ),
      ),
    );
  }

  /// 変更を保存するボタン
  Widget _saveButton(BuildContext context) {
    return TextButton(
      onPressed: saveOnPressed,
      child: Text(
        AppLocalizations.of(context)!.pickerSaveButton,
        style: TextStyle(
          fontSize: 15.5.sp,
          color: colors.appColor,
        ),
      ),
    );
  }
}
