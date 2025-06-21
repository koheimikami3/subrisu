import '../../../constants/configs.dart' as configs;
import '../../../importer.dart';

/// テーマをダークに変更するタイル
class SelectDarkThemeTile extends ConsumerWidget {
  const SelectDarkThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingsNotifierProvider);

    return MyListTile(
      position: ItemPosition.bottom,
      name: AppLocalizations.of(context)!.theme(ThemeSetting.dark.name),
      leadingIcon: Icons.dark_mode_outlined,
      trailing: CheckedIcon(isChecked: themeSetting == ThemeSetting.dark),
      onTap: () async {
        await ref
            .read(sharedPreferencesProvider)
            .setInt(configs.themeKey, ThemeSetting.dark.index);
        ref.read(themeSettingsNotifierProvider.notifier).setDark();
      },
    );
  }
}
