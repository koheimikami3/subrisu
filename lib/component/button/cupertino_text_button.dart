import 'package:flutter/cupertino.dart';

import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

class CupertinoTextButton extends ConsumerWidget {
  const CupertinoTextButton({
    Key? key,
    required this.text,
    this.color = configs.appColor,
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
        fontSize: 16.sp,
        color: color,
      ),
    );
  }
}
