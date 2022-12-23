import 'package:flutter/cupertino.dart';

import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

class CupertinoTextButton extends ConsumerWidget {
  const CupertinoTextButton({
    Key? key,
    required this.text,
    this.color = colors.appColor,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: _text(),
    );
  }

  /// ボタンのテキストを表示する
  Widget _text() {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15.5.sp,
        color: color,
      ),
    );
  }
}
