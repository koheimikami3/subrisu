import '../../constant/colors.dart' as colors;
import '../../constant/configs.dart' as configs;
import '../../importer.dart';

/// カスタムFilledButton
class MyFilledButton extends ConsumerWidget {
  const MyFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text; // テキスト
  final VoidCallback? onPressed; // タップ時の動作

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);

    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: colors.appColor,
          disabledBackgroundColor: selectColor(
            context: context,
            themeSetting: themeSetting,
            lightColor: Colors.grey.shade300,
            darkColor: Colors.grey.shade600,
          ),
          textStyle: TextStyle(
            fontSize: configs.defaultFontSize.sp,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: configs.defaultFontSize.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
