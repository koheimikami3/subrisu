import '../../importer.dart';

/// 言語設定画面のScaffoldBody
class LanguageSettingsPageBody extends StatelessWidget {
  const LanguageSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        for (int i = 0; i < LanguageSettings.values.length; i++)
          Column(
            children: [
              SelectLanguageTile(
                position: i == LanguageSettings.values.length - 1
                    ? TilePosition.bottom
                    : i == 0
                        ? TilePosition.top
                        : TilePosition.middle,
                languageSettings: LanguageSettings.values[i],
              ),
              if (i < LanguageSettings.values.length - 1) const ItemDivider(),
            ],
          ),
      ],
    );
  }
}
