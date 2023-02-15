import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// リスト画面
class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  @override
  void initState() {
    super.initState();

    // 例外が発生しないように画面描画後に処理を実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 強制アップデート対象の場合、ダイアログを表示
      AppManager.checkForceAppVersion(context);

      // アップデート内容表示対象の場合、ダイアログを表示
      AppManager.checkUpdateContents(context);

      // 初回起動の場合、プッシュ通知設定ダイアログを表示
      AppManager.checkNotificationSetting();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isUserLoaded = ref.watch(isUserLoadedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.listPage),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: const CreatePageButton(),
      body: !isUserLoaded
          ? const Center(child: LoadingIndicator())
          : const SubscriptionList(),
    );
  }
}
