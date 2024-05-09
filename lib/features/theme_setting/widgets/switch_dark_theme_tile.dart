import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// ダークテーマに変更するタイル
class SwitchDarkThemeTile extends ConsumerWidget {
  const SwitchDarkThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);

    return MyListTile(
      position: ItemPosition.bottom,
      name: ThemeSetting.dark.name,
      leadingIcon: Icons.dark_mode_outlined,
      trailing: themeSetting == ThemeSetting.dark
          ? const CheckIcon()
          : const SizedBox.shrink(),
      onTap: () async {
        await ref
            .read(sharedPreferencesProvider)
            .setInt(configs.themeKey, ThemeSetting.dark.index);
        ref.read(themeSettingNotifierProvider.notifier).setDark();
      },
    );
  }
}
