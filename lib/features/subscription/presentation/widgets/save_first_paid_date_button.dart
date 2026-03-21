import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/save_picker_value_button.dart';
import 'package:subrisu/features/subscription/presentation/subscription_form_provider.dart';

/// Pickerで選択した初回支払い日を保存するボタン
class SaveFirstPaidDateButton extends ConsumerWidget {
  const SaveFirstPaidDateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavePickerValueButton(
      onPressed: () {
        // 選択確定初回支払い日の状態を更新
        ref
            .read(subscriptionFormNotifierProvider.notifier)
            .setResultFirstPaidDate();
      },
    );
  }
}
