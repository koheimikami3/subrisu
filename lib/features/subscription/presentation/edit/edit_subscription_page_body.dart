import '../../../../importer.dart';

/// サブスクリプション編集画面のScaffoldBody
class EditSubscriptionPageBody extends StatelessWidget {
  const EditSubscriptionPageBody({
    super.key,
    required this.subscription,
  });

  final Subscription subscription; // サブスクリプション

  @override
  Widget build(BuildContext context) {
    return SubscriptionForm(
      serviceName: subscription.serviceName,
      price: subscription.price.toString(),
      paymentCycle: subscription.paymentCycle,
      memo: subscription.note,
      button: UpdateSubscriptionButton(subscriptionId: subscription.id),
    );
  }
}
