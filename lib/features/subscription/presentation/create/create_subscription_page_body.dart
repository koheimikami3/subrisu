import 'package:flutter/material.dart';
import 'package:subrisu/features/subscription/presentation/create/widgets/create_subscription_button.dart';
import 'package:subrisu/features/subscription/presentation/widgets/subscription_form.dart';

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
