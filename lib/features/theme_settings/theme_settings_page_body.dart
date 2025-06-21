import '../../importer.dart';

/// テーマ設定画面のScaffoldBody
class ThemeSettingsPageBody extends StatelessWidget {
  const ThemeSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        const SelectDeviceThemeTile(),
        const ItemDivider(),
        const SelectLightThemeTile(),
        const ItemDivider(),
        const SelectDarkThemeTile(),
      ],
    );
  }
}
