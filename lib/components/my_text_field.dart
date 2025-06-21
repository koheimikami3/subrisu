import '../constants/colors.dart' as colors;
import '../constants/configs.dart' as configs;
import '../importer.dart';

/// カスタムTextFormField
class MyTextFormField extends ConsumerWidget {
  const MyTextFormField({
    super.key,
    this.initialValue,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.hintText,
    required this.onChanged,
  });

  final String? initialValue; // 初期値
  final int minLines; // 最小行数
  final int? maxLines; // 最大行数
  final int? maxLength; // 最大文字数
  final TextInputType? keyboardType; // キーボードの種類
  final List<TextInputFormatter>? inputFormatters; // 入力制限
  final String? hintText; // ヒントテキスト
  final void Function(String) onChanged; // 入力時の動作

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return TextFormField(
      initialValue: initialValue,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: colors.appColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: configs.defaultFontSize.sp),
        counterText: '',
        filled: true,
        fillColor: selectColor(
          context: context,
          themeSettings: themeSettings,
          lightColor: Colors.white,
          darkColor: colors.darkItemColor,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
