import '../constant/colors.dart' as colors;
import '../constant/texts.dart' as texts;
import '../importer.dart';

class CupertinoPickerSheet extends StatelessWidget {
  const CupertinoPickerSheet({
    super.key,
    required this.picker,
    required this.saveOnPressed,
  });

  final Widget picker;
  final VoidCallback saveOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 15.w),
              _cancelButton(context),
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
  Widget _cancelButton(BuildContext context) {
    return CupertinoTextButton(
      text: texts.pickerCancelButton,
      color: Colors.grey.shade800,
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
