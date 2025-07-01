import '../../../../importer.dart';

/// Pickerで選択した初回支払い日を保存するボタン
class SaveFirstPaidDateButton extends ConsumerWidget {
  const SaveFirstPaidDateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        // 選択確定初回支払い日の状態を更新
        ref
            .read(subscriptionFormNotifierProvider.notifier)
            .setResultFirstPaidDate();

        // Pickerを閉じる
        Navigator.pop(context);
      },
      child: Text(
        AppLocalizations.of(context)!.pickerSaveButton,
        style: TextStyle(
          fontSize: 15.5.sp,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
