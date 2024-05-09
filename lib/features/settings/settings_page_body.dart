import '../../importer.dart';

/// 設定画面のScaffoldBody
class SettingsPageBody extends StatelessWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 25.h),
                const MoveBillingPageTile(),
                SizedBox(height: 25.h),
                const AppItemList(),
                SizedBox(height: 25.h),
                const SupportItemList(),
                SizedBox(height: 25.h),
                const AppVersionTile(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
