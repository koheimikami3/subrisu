import 'package:subrisu/importer.dart';

/// 設定画面のUIを作成する
class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Texts.settingsPage),
        automaticallyImplyLeading: false,
      ),
      body: Material(
        color: isDark
            ? Configs.darkBackgroundColor
            : Configs.settingsBackgroundColor,
        child: SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 25.h),
                    const PaidPlan(),
                    SizedBox(height: 25.h),
                    const AppSettings(),
                    SizedBox(height: 25.h),
                    const Supports(),
                    SizedBox(height: 25.h),
                    const AppVersion(),
                    SizedBox(height: 35.h),
                    const DeleteUserButton(),
                    SizedBox(height: 25.h),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
