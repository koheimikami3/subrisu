import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// 端末テーマに変更するタイル
class SwitchDeviceThemeTile extends ConsumerWidget {
  const SwitchDeviceThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);

    return MyListTile(
      position: ItemPosition.top,
      name: AppLocalizations.of(context)!.theme(ThemeSetting.device.name),
      leadingIcon: Icons.phone_iphone_outlined,
      trailing: themeSetting == ThemeSetting.device
          ? const CheckIcon()
          : const SizedBox.shrink(),
      onTap: () async {
        await ref
            .read(sharedPreferencesProvider)
            .setInt(configs.themeKey, ThemeSetting.device.index);
        ref.read(themeSettingNotifierProvider.notifier).setDevice();
      },
    );
  }
}
