import '../../constant/configs.dart' as configs;
import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// リスト画面のUIを作成する
class ListPage extends ConsumerStatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  @override
  void initState() {
    super.initState();

    notification();
  }

  Future<void> notification() async {
    final messaging = FirebaseMessaging.instance;

    // プッシュ通知の設定状況を取得
    final prefs = await SharedPreferences.getInstance();
    final notification = prefs.getBool(configs.notificationKey) ?? false;

    if (!notification) {
      await messaging.requestPermission();

      await prefs.setBool(configs.notificationKey, true);
    }
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
