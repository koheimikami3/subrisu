import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/my_text_field.dart';
import 'package:subrisu/features/subscription/presentation/subscription_form_provider.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// サービス名を入力するフォーム
class ServiceNameInputForm extends ConsumerWidget {
  const ServiceNameInputForm({
    super.key,
    this.serviceName,
  });

  final String? serviceName; // サービス名

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyTextFormField(
      initialValue: serviceName,
      hintText: AppLocalizations.of(context)!.serviceNameHint,
      onChanged: (value) {
        // サービス名の状態を更新
        ref
            .read(subscriptionFormNotifierProvider.notifier)
            .setServiceName(value);
      },
    );
  }
}
