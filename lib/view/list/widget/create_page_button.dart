import 'package:subrisu/view/create/create_page.dart';

import '../../../importer.dart';

/// 作成画面に遷移するボタン
class CreatePageButton extends StatelessWidget {
  const CreatePageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePage(),
              //以下を追加
              fullscreenDialog: true,
            ));

        // showModalBottomSheet(
        //   backgroundColor: Colors.transparent,
        //   isScrollControlled: true,
        //   context: context,
        //   builder: (_) => const CreatePage(),
        // );
      },
      child: const Icon(Icons.add),
    );
  }
}
