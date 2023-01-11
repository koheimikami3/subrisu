import 'package:flutter/cupertino.dart';

import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

class MyCupertinoButton extends ConsumerWidget {
  const MyCupertinoButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: CupertinoButton(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        padding: EdgeInsets.zero,
        color: colors.appColor,
        disabledColor: isDark ? Colors.grey.shade600 : Colors.grey.shade300,
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
