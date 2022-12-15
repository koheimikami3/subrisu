import '../../constant/configs.dart' as configs;
import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// リスト画面のUIを作成する
class ListPage extends ConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUserDataLoaded = ref.watch(isUserDataLoadedProvider);
    final isDark = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.listPage),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: const CreatePageButton(),
      backgroundColor: isDark
          ? configs.darkBackgroundColor
          : configs.settingsBackgroundColor,
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
