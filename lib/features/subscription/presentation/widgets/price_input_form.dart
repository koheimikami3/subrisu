import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/my_text_field.dart';
import 'package:subrisu/features/subscription/presentation/subscription_form_provider.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/currency_settings_provider.dart';

/// 料金を入力するフォーム
class PriceInputForm extends ConsumerWidget {
  const PriceInputForm({
    super.key,
    this.price,
  });

  final String? price; // 料金

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySettings = ref.watch(currencySettingsNotifierProvider);

    return Row(
      children: [
        Text(currencySettings.symbol),
        Expanded(
          child: MyTextFormField(
            initialValue: price,
            maxLength: 7,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            hintText: AppLocalizations.of(context)!.priceHint,
            onChanged: (value) {
              // 料金の状態を更新
              ref
                  .read(subscriptionFormNotifierProvider.notifier)
                  .setPrice(value);
            },
          ),
        ),
      ],
    );
  }
}
