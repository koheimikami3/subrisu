import '../../../../../importer.dart';

/// サブスクリプション作成画面に遷移するボタン
class MoveCreateSubscriptionPageButton extends StatelessWidget {
  const MoveCreateSubscriptionPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const CreateSubscriptionPage(),
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
