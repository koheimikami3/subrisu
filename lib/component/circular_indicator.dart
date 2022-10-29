import 'package:flutter/cupertino.dart';

import '../importer.dart';

/// データ処理の実行中を知らせるインジケーター
class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const CircularProgressIndicator()
        : const CupertinoActivityIndicator(radius: 20, color: Colors.white);
  }
}
