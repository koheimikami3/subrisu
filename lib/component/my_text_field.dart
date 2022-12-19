import '../constant/colors.dart' as colors;
import '../importer.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: colors.appColor,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14.sp),
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
