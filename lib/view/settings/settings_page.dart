import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 設定画面のUIを作成する
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.settingsPage),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  const PaidPlan(),
                  SizedBox(height: 25.h),
                  const Apps(),
                  SizedBox(height: 25.h),
                  const Supports(),
                  SizedBox(height: 25.h),
                  const AppVersion(),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}
