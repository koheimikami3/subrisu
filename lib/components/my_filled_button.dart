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
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: selectColor(
            context: context,
            themeSettings: themeSettings,
            lightColor: Colors.grey.shade300,
            darkColor: Colors.grey.shade600,
          ),
          textStyle: TextStyle(
            fontSize: AppConfigs.defaultFontSize.sp,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: AppConfigs.defaultFontSize.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
