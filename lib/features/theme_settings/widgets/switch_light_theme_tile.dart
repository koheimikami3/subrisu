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
      trailing: themeSetting == ThemeSetting.light
          ? const CheckIcon()
          : const SizedBox.shrink(),
      onTap: () async {
        await ref
            .read(sharedPreferencesProvider)
            .setInt(configs.themeKey, ThemeSetting.light.index);
        ref.read(themeSettingsNotifierProvider.notifier).setLight();
      },
    );
  }
}
