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
            builder: (_) => const CreatePage(),
            fullscreenDialog: true,
          ),
        );
      },
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}
