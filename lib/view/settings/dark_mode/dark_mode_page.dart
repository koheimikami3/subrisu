import '../../../constant/colors.dart' as colors;
import '../../../constant/configs.dart' as configs;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// ダークモード画面のUIを作成する
class DarkModePage extends ConsumerWidget {
  const DarkModePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeSettingProvider);
    final isDark = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.darkModePage),
      ),
      body: Material(
        color:
            isDark ? colors.darkBackgroundColor : colors.lightBackgroundColor,
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
                    trailing:
                        mode == 0 ? _checkIcon() : const SizedBox.shrink(),
                    onTap: () => _onDeviceSettingTap(context, ref),
                  ),
                  SettingItem(
                    middleItem: true,
                    itemName: texts.lightSettingItem,
                    leadingIcon: Icons.light_mode_outlined,
                    trailing:
                        mode == 1 ? _checkIcon() : const SizedBox.shrink(),
                    onTap: () => _onLightModeTap(ref),
                  ),
                  SettingItem(
                    bottomItem: true,
                    itemName: texts.darkSettingItem,
                    leadingIcon: Icons.dark_mode_outlined,
                    trailing:
                        mode == 2 ? _checkIcon() : const SizedBox.shrink(),
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
    final prefs = await SharedPreferences.getInstance();

    // 設定を保存
    await prefs.setInt(configs.themeKey, configs.deviceTheme);
    ref.watch(themeSettingProvider.notifier).state = configs.deviceTheme;

    // 端末のテーマ設定を取得し、ダークモードか判定
    // ignore: use_build_context_synchronously
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = brightness == Brightness.dark;
    ref.watch(darkModeProvider.notifier).state = isDark;
  }

  /// テーマ設定をライトモードにする
  Future<void> _onLightModeTap(WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();

    // 設定を保存
    await prefs.setInt(configs.themeKey, configs.lightTheme);
    ref.watch(themeSettingProvider.notifier).state = configs.lightTheme;
    ref.watch(darkModeProvider.notifier).state = false;
  }

  /// テーマ設定をダークモードにする
  Future<void> _onDarkModeTap(WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();

    // 設定を保存
    await prefs.setInt(configs.themeKey, configs.darkTheme);
    ref.watch(themeSettingProvider.notifier).state = configs.darkTheme;
    ref.watch(darkModeProvider.notifier).state = true;
  }
}
