import '../constant/colors.dart' as colors;
import '../constant/texts.dart' as texts;
import '../importer.dart';

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
    final isDark = ref.watch(darkModeProvider);

    return Container(
      height: 200.h,
      color: isDark ? colors.darkItemColor : Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 15.w),
              _cancelButton(context, isDark),
              const Spacer(),
              _saveButton(),
              SizedBox(width: 15.w),
            ],
          ),
          Expanded(child: picker),
        ],
      ),
    );
  }

  /// 変更をキャンセルしてPickerを閉じるボタン
  Widget _cancelButton(BuildContext context, bool isDark) {
    return CupertinoTextButton(
      text: texts.pickerCancelButton,
      color: isDark ? Colors.white : Colors.grey.shade800,
      onPressed: () => Navigator.pop(context),
    );
  }

  /// 変更を保存するボタン
  Widget _saveButton() {
    return CupertinoTextButton(
      text: texts.pickerSaveButton,
      color: colors.appColor,
      onPressed: saveOnPressed,
    );
  }
}
