import 'package:subrisu/importer.dart';

/// 作成画面に遷移するボタン
class CreatePageButton extends StatelessWidget {
  const CreatePageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
