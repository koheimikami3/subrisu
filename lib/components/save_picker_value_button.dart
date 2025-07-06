import '../../../../importer.dart';

/// Pickerで選択した値を保存するボタン
class SavePickerValueButton extends StatelessWidget {
  const SavePickerValueButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed; // タップ時の動作

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // コールバックを実行
        onPressed.call();

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
