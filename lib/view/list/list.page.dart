import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// リスト画面のUIを作成する
class ListPage extends ConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUserDataLoaded = ref.watch(isUserDataLoadedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.listPage),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: const CreatePageButton(),
      body: !isUserDataLoaded
          ? const Center(child: LoadingIndicator())
          : Column(
              children: const [],
            ),
    );
  }
}
