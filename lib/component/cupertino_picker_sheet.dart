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
    final isDarkMode = ref.watch(darkModeNotifierProvider);

    return Container(
      height: 200.h,
      color: isDarkMode ? colors.darkItemColor : Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 15.w),
              _cancelButton(context, isDarkMode),
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
  Widget _cancelButton(BuildContext context, bool isDarkMode) {
    return CupertinoTextButton(
      text: texts.pickerCancelButton,
      color: isDarkMode ? Colors.white : Colors.grey.shade800,
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
