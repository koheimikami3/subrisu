import '../../../constants/configs.dart' as configs;
import '../../../importer.dart';

/// 言語を英語に変更するタイル
class SelectEnglishTile extends ConsumerWidget {
  const SelectEnglishTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageSetting = ref.watch(languageSettingsNotifierProvider);

    return MyListTile(
      position: ItemPosition.bottom,
      name:
          AppLocalizations.of(context)!.language(LanguageSettings.english.name),
      trailing:
          CheckedIcon(isChecked: languageSetting == LanguageSettings.english),
      onTap: () async {
        await ref
            .read(sharedPreferencesProvider)
            .setInt(configs.languageKey, LanguageSettings.english.index);
        ref.read(languageSettingsNotifierProvider.notifier).setEnglish();
      },
    );
  }
}
