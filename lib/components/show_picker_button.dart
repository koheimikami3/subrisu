import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// CupertinoPickerを表示するボタン
class ShowPickerButton extends StatelessWidget {
  const ShowPickerButton({
    super.key,
    this.onTap,
    required this.picker,
    required this.saveButton,
    required this.text,
  });

  final VoidCallback? onTap; // タップ時の動作
  final Widget picker; // Picker
  final Widget saveButton; // saveButton
  final String text; // テキスト

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // onTapが指定されていれば実行
        onTap?.call();

        // CupertinoPickerを呼び出す
        showCupertinoModalPopup<void>(
          context: context,
          builder: (_) {
            return CupertinoPickerSheet(
              picker: picker,
              saveButton: saveButton,
            );
          },
        );
      },
      child: Row(
        children: [
          Text(text),
          Icon(
            Icons.unfold_more,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
