import '../../../constant/colors.dart' as colors;
import '../../../constant/configs.dart' as configs;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// ダークモード画面のUIを作成する
class DarkModePage extends ConsumerWidget {
  const DarkModePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);
    final isDarkMode = ref.watch(darkModeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.darkModePage),
      ),
      body: Material(
        color: isDarkMode
            ? colors.darkBackgroundColor
            : colors.lightBackgroundColor,
        child: Row(
          children: [
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  SettingItem(
                    topItem: true,
                    itemName: texts.deviceSettingItem,
                    leadingIcon: Icons.phone_iphone_outlined,
                    trailing: themeSetting == ThemeSetting.device
                        ? _checkIcon()
                        : const SizedBox.shrink(),
                    onTap: () => _onDeviceSettingTap(context, ref),
                  ),
                  SettingItem(
                    middleItem: true,
                    itemName: texts.lightSettingItem,
                    leadingIcon: Icons.light_mode_outlined,
                    trailing: themeSetting == ThemeSetting.light
                        ? _checkIcon()
                        : const SizedBox.shrink(),
                    onTap: () => _onLightModeTap(ref),
                  ),
                  SettingItem(
                    bottomItem: true,
                    itemName: texts.darkSettingItem,
                    leadingIcon: Icons.dark_mode_outlined,
                    trailing: themeSetting == ThemeSetting.dark
                        ? _checkIcon()
                        : const SizedBox.shrink(),
                    onTap: () => _onDarkModeTap(ref),
                  ),
                  SizedBox(height: 25.h),
                ],
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }

  /// チェックアイコンを表示する
  Icon _checkIcon() {
    return const Icon(
      Icons.check,
      size: 22,
      color: colors.appColor,
    );
  }

  /// テーマ設定を端末設定と同じにする
  Future<void> _onDeviceSettingTap(BuildContext context, WidgetRef ref) async {
    final prefs = GetIt.I<SharedPreferences>();

    // 設定を保存
    await prefs.setInt(configs.themeKey, ThemeSetting.device.index);
    ref.read(themeSettingNotifierProvider.notifier).setDevice();

    // 端末のテーマ設定を取得し、ダークモードか判定
    final brightness = MediaQuery.platformBrightnessOf(context);
    ref
        .read(darkModeNotifierProvider.notifier)
        .setSetting(isDarkMode: brightness == Brightness.dark);
  }

  /// テーマ設定をライトモードにする
  Future<void> _onLightModeTap(WidgetRef ref) async {
    final prefs = GetIt.I<SharedPreferences>();

    // 設定を保存
    await prefs.setInt(configs.themeKey, ThemeSetting.light.index);
    ref.read(themeSettingNotifierProvider.notifier).setLight();
    ref.read(darkModeNotifierProvider.notifier).setSetting(isDarkMode: false);
  }

  /// テーマ設定をダークモードにする
  Future<void> _onDarkModeTap(WidgetRef ref) async {
    final prefs = GetIt.I<SharedPreferences>();

    // 設定を保存
    await prefs.setInt(configs.themeKey, ThemeSetting.dark.index);
    ref.read(themeSettingNotifierProvider.notifier).setDark();
    ref.read(darkModeNotifierProvider.notifier).setSetting(isDarkMode: true);
  }
}
