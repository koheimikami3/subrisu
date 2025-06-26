import '../../../importer.dart';

/// 言語を変更するタイル
class SelectLanguageTile extends ConsumerWidget {
  const SelectLanguageTile({
    super.key,
    required this.position,
    required this.languageSettings,
  });

  final TilePosition position;
  final LanguageSettings languageSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguageSettings =
        ref.watch(languageSettingsNotifierProvider);

    return MyListTile(
      position: position,
      name: AppLocalizations.of(context)!.language(languageSettings.name),
      trailing:
          CheckedIcon(isChecked: selectedLanguageSettings == languageSettings),
      onTap: () {
        ref
            .read(languageSettingsNotifierProvider.notifier)
            .set(languageSettings);
      },
    );
  }
}
