import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// リスト画面のUIを作成する
class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  @override
  void initState() {
    super.initState();

    // プッシュ通知設定ダイアログの表示状況を取得し、初めての場合は表示する
    AppManager.getNotification();
  }

  @override
  Widget build(BuildContext context) {
    final isUserDataLoaded = ref.watch(isUserDataLoadedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.listPage),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: const CreatePageButton(),
      body: !isUserDataLoaded
          ? const Center(child: LoadingIndicator())
          : SingleChildScrollView(
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  const Expanded(child: SubscriptionList()),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
    );
  }
}
