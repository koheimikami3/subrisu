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
      price: subscription.price,
      paymentCycle: subscription.paymentCycle,
      firstPaidOn: subscription.firstPaidOn.toDate(),
      memo: subscription.memo,
      button: UpdateSubscriptionButton(subscriptionId: subscription.id),
    );
  }
}
