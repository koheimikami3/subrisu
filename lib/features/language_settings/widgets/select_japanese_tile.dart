import '../../../importer.dart';

/// 言語を日本語に変更するタイル
class SelectJapaneseTile extends ConsumerWidget {
  const SelectJapaneseTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageSettings = ref.watch(languageSettingsNotifierProvider);

    return MyListTile(
      position: TilePosition.top,
      name: AppLocalizations.of(context)!
          .language(LanguageSettings.japanese.name),
      trailing:
          CheckedIcon(isChecked: languageSettings == LanguageSettings.japanese),
      onTap: () {
        ref.read(languageSettingsNotifierProvider.notifier).setJapanese();
      },
    );
  }
}
