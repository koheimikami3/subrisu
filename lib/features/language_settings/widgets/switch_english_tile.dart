import '../../../constants/configs.dart' as configs;
import '../../../importer.dart';

/// 英語に変更するタイル
class SwitchEnglishTile extends ConsumerWidget {
  const SwitchEnglishTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageSetting = ref.watch(languageSettingNotifierProvider);

    return MyListTile(
      position: ItemPosition.bottom,
      name:
          AppLocalizations.of(context)!.language(LanguageSetting.english.name),
      trailing:
          CheckedIcon(isChecked: languageSetting == LanguageSetting.english),
      onTap: () async {
        await ref
            .read(sharedPreferencesProvider)
            .setInt(configs.languageKey, LanguageSetting.english.index);
        ref.read(languageSettingNotifierProvider.notifier).setEnglish();
      },
    );
  }
}
