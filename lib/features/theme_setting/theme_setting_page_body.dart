import '../../importer.dart';

/// テーマ設定画面のScaffoldBody
class ThemeSettingPageBody extends StatelessWidget {
  const ThemeSettingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        const SwitchDeviceThemeTile(),
        const ItemDivider(),
        const SwitchLightThemeTile(),
        const ItemDivider(),
        const SwitchDarkThemeTile(),
      ],
    );
  }
}
