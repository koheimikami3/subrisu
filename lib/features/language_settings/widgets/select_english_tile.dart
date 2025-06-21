import '../../../importer.dart';

/// 言語を英語に変更するタイル
class SelectEnglishTile extends ConsumerWidget {
  const SelectEnglishTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageSettings = ref.watch(languageSettingsNotifierProvider);

    return MyListTile(
      position: ItemPosition.bottom,
      name:
          AppLocalizations.of(context)!.language(LanguageSettings.english.name),
      trailing:
          CheckedIcon(isChecked: languageSettings == LanguageSettings.english),
      onTap: () {
        ref.read(languageSettingsNotifierProvider.notifier).setEnglish();
      },
    );
  }
}
