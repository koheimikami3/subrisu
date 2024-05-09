import '../../../../importer.dart';

/// サブスクリプション作成画面のScaffoldBody
class CreateSubscriptionPageBody extends StatelessWidget {
  const CreateSubscriptionPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SubscriptionForm(
      button: CreateSubscriptionButton(),
    );
  }
}
