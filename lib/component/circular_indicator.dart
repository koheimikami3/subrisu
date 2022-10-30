import 'package:flutter/cupertino.dart';

import '../importer.dart';

/// データ処理の実行中を知らせるインジケーター
class CircularIndicator extends ConsumerWidget {
  const CircularIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Platform.isAndroid
        ? const CircularProgressIndicator()
        : CupertinoActivityIndicator(
            radius: 17,
            color: isDark ? Colors.black : null,
          );
  }
}
