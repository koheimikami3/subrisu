import '../../importer.dart';

/// テーマ設定画面のScaffoldBody
class ThemeSettingsPageBody extends StatelessWidget {
  const ThemeSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        for (int i = 0; i < ThemeSettings.values.length; i++)
          Column(
            children: [
              SelectThemeTile(
                position: i == ThemeSettings.values.length - 1
                    ? TilePosition.bottom
                    : i == 0
                        ? TilePosition.top
                        : TilePosition.middle,
                themeSettings: ThemeSettings.values[i],
              ),
              if (i < ThemeSettings.values.length - 1) const ItemDivider(),
            ],
          ),
      ],
    );
  }
}
