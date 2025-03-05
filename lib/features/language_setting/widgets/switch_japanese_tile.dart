import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// 日本語に変更するタイル
class SwitchJapaneseTile extends ConsumerWidget {
  const SwitchJapaneseTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageSetting = ref.watch(languageSettingNotifierProvider);

    return MyListTile(
      position: ItemPosition.top,
      name:
          AppLocalizations.of(context)!.language(LanguageSetting.japanese.name),
      trailing: languageSetting == LanguageSetting.japanese
          ? const CheckIcon()
          : const SizedBox.shrink(),
      onTap: () async {
        await ref
            .read(sharedPreferencesProvider)
            .setInt(configs.languageKey, LanguageSetting.japanese.index);
        ref.read(languageSettingNotifierProvider.notifier).setJapanese();
      },
    );
  }
}
