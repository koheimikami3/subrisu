import '../../../constants/configs.dart' as configs;
import '../../../importer.dart';

/// ライトテーマに変更するタイル
class SwitchLightThemeTile extends ConsumerWidget {
  const SwitchLightThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingsNotifierProvider);

    return MyListTile(
      position: ItemPosition.middle,
      name: AppLocalizations.of(context)!.theme(ThemeSetting.light.name),
      leadingIcon: Icons.light_mode_outlined,
      trailing: CheckedIcon(isChecked: themeSetting == ThemeSetting.light),
      onTap: () async {
        await ref
            .read(sharedPreferencesProvider)
            .setInt(configs.themeKey, ThemeSetting.light.index);
        ref.read(themeSettingsNotifierProvider.notifier).setLight();
      },
    );
  }
}
