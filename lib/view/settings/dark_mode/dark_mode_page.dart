import 'package:subrisu/importer.dart';

/// ダークモード画面のUIを作成する
class DarkModePage extends ConsumerWidget {
  const DarkModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeSettingProvider);
    final isDark = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Texts.darkModePage),
      ),
      body: Material(
        color: isDark
            ? Configs.darkBackgroundColor
            : Configs.settingsBackgroundColor,
        child: Row(
          children: [
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  SettingItem(
                    topItem: true,
                    itemName: Texts.deviceSettingItem,
                    leadingIcon: Icons.phone_iphone_outlined,
                    trailing:
                        mode == 0 ? _checkIcon() : const SizedBox.shrink(),
                    onTap: () => _onDeviceSettingTap(context, ref),
                  ),
                  SettingItem(
                    middleItem: true,
                    itemName: Texts.lightSettingItem,
                    leadingIcon: Icons.light_mode_outlined,
                    trailing:
                        mode == 1 ? _checkIcon() : const SizedBox.shrink(),
                    onTap: () => _onLightModeTap(ref),
                  ),
                  SettingItem(
                    bottomItem: true,
                    itemName: Texts.darkSettingItem,
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
      color: Configs.appColor,
    );
  }

  /// テーマ設定を端末設定と同じにする
  void _onDeviceSettingTap(BuildContext context, WidgetRef ref) {
    ref.watch(themeSettingProvider.notifier).state = 0;

    // 端末のテーマ設定を取得し、ダークモードか判定
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = brightness == Brightness.dark;
    ref.watch(darkModeProvider.notifier).state = isDark;
  }

  /// テーマ設定をライトモードにする
  void _onLightModeTap(WidgetRef ref) {
    ref.watch(themeSettingProvider.notifier).state = 1;
    ref.watch(darkModeProvider.notifier).state = false;
  }

  /// テーマ設定をダークモードにする
  void _onDarkModeTap(WidgetRef ref) {
    ref.watch(themeSettingProvider.notifier).state = 2;
    ref.watch(darkModeProvider.notifier).state = true;
  }
}
