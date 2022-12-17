import 'package:flutter/cupertino.dart';

import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

class MyCupertinoButton extends ConsumerWidget {
  const MyCupertinoButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: CupertinoButton(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        padding: EdgeInsets.zero,
        color: configs.appColor,
        onPressed: onPressed,
        child: _text(),
      ),
    );
  }

  /// ボタンのテキストを表示する
  Widget _text() {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
