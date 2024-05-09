import '../../../../constant/texts.dart' as texts;
import '../../../../importer.dart';

/// サブスクリプション作成画面
class CreateSubscriptionPage extends StatelessWidget {
  const CreateSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text(texts.createSubscriptionPageTitle)),
        body: const CreateSubscriptionPageBody(),
      ),
    );
  }
}
