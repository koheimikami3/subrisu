import '../../importer.dart';

/// 言語設定画面のScaffoldBody
class LanguageSettingsPageBody extends StatelessWidget {
  const LanguageSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        const SwitchJapaneseTile(),
        const ItemDivider(),
        const SwitchEnglishTile(),
      ],
    );
  }
}
