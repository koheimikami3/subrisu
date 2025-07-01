import '../../../../importer.dart';

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
