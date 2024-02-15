import 'package:flutter/cupertino.dart';

import '../importer.dart';

/// データ処理の実行中を知らせるインジケーター
class CircularIndicator extends ConsumerWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeNotifierProvider);

    return Platform.isAndroid
        ? const CircularProgressIndicator()
        : CupertinoActivityIndicator(
            radius: 17,
            color: isDarkMode ? Colors.black : null,
          );
  }
}
