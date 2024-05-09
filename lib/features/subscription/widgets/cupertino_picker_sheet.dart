import '../../../constant/colors.dart' as colors;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

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
              _saveButton(),
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
        texts.pickerCancelButton,
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
  Widget _saveButton() {
    return TextButton(
      onPressed: saveOnPressed,
      child: Text(
        texts.pickerSaveButton,
        style: TextStyle(
          fontSize: 15.5.sp,
          color: colors.appColor,
        ),
      ),
    );
  }
}
