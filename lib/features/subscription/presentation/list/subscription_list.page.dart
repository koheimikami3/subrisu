import '../../../../importer.dart';

/// サブスクリプション一覧画面
class SubscriptionListPage extends ConsumerStatefulWidget {
  const SubscriptionListPage({super.key});

  @override
  ConsumerState<SubscriptionListPage> createState() =>
      _SubscriptionListPageState();
}

class _SubscriptionListPageState extends ConsumerState<SubscriptionListPage> {
  @override
  void initState() {
    super.initState();

    // 画面描画後に処理を実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 強制アップデート対象の場合、ダイアログを表示
      AppManager.checkForceAppVersion(context);

      // 初回起動の場合、広告トラッキング設定ダイアログを表示
      AppManager.showAppTrackingTransparency();

      // 初回起動の場合、プッシュ通知設定ダイアログを表示
      AppManager.checkNotificationSetting();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TotalPrice(),
        automaticallyImplyLeading: false,
        actions: const [SortButton()],
      ),
      floatingActionButton: const MoveCreateSubscriptionPageButton(),
      body: const SubscriptionListPageBody(),
    );
  }
}
