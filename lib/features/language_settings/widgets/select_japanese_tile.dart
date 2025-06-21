import '../../../constants/configs.dart' as configs;
import '../../../importer.dart';

/// 言語を日本語に変更するタイル
class SelectJapaneseTile extends ConsumerWidget {
  const SelectJapaneseTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageSetting = ref.watch(languageSettingNotifierProvider);

    return MyListTile(
      position: ItemPosition.top,
      name:
          AppLocalizations.of(context)!.language(LanguageSetting.japanese.name),
      trailing:
          CheckedIcon(isChecked: languageSetting == LanguageSetting.japanese),
      onTap: () async {
        await ref
            .read(sharedPreferencesProvider)
            .setInt(configs.languageKey, LanguageSetting.japanese.index);
        ref.read(languageSettingNotifierProvider.notifier).setJapanese();
      },
    );
  }
}
