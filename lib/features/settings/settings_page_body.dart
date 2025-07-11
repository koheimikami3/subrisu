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
                const GoToPurchasePageTile(),
                SizedBox(height: 25.h),
                const AppItemList(),
                SizedBox(height: 25.h),
                const SupportItemList(),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
