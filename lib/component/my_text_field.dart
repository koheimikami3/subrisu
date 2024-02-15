import '../constant/colors.dart' as colors;
import '../constant/configs.dart' as configs;
import '../importer.dart';

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

  final String? initialValue;
  final int minLines;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeNotifierProvider);

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
        fillColor: isDarkMode ? colors.darkItemColor : Colors.white,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
