import '../../../../importer.dart';

class CupertinoPickerSheet extends ConsumerWidget {
  const CupertinoPickerSheet({
    super.key,
    required this.picker,
    required this.saveButton,
  });

  final Widget picker;
  final Widget saveButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Container(
      height: 200.h,
      color: selectColor(
        context: context,
        themeSettings: themeSettings,
        lightColor: Colors.white,
        darkColor: AppColors.darkItem,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10.w),
              _cancelButton(context, themeSettings),
              const Spacer(),
              saveButton,
              SizedBox(width: 10.w),
            ],
          ),
          Expanded(child: picker),
        ],
      ),
    );
  }

  /// 変更をキャンセルしてPickerを閉じるボタン
  Widget _cancelButton(BuildContext context, ThemeSettings themeSettings) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        AppLocalizations.of(context)!.cancelButton,
        style: TextStyle(
          fontSize: 15.5.sp,
          color: selectColor(
            context: context,
            themeSettings: themeSettings,
            lightColor: Colors.grey.shade800,
            darkColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
