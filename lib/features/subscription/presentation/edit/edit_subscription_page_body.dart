import 'package:flutter/material.dart';
import 'package:subrisu/features/subscription/domain/subscription/subscription.dart';
import 'package:subrisu/features/subscription/presentation/edit/widgets/update_subscription_button.dart';
import 'package:subrisu/features/subscription/presentation/widgets/subscription_form.dart';

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
