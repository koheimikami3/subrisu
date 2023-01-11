import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 作成画面のUIを作成する
class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text(texts.createPage)),
        body: const SubscriptionForm(
          button: RegisterButton(),
        ),
      ),
    );
  }
}
