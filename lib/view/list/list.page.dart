import 'package:subrisu/importer.dart';
import '../../constant/texts.dart' as texts;

/// リスト画面のUIを作成する
class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.listPage),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: const CreatePageButton(),
      body: Column(
        children: const [],
      ),
    );
  }
}
