import 'package:flutter/cupertino.dart';

import '../../../../../constant/urls.dart' as urls;
import '../../../../../importer.dart';

/// 強制アップデートを知らせるダイアログ
class ForceUpdateDialog {
  const ForceUpdateDialog();

  static void show(BuildContext context, String version) {
    const title = 'アップデートのお知らせ';
    final content = '新しいバージョンのアプリが利用可能です。'
        '今すぐバージョン$versionにアップデートしてください。';

    showCupertinoDialog<void>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(title),
          content: Text(content),
          actions: [_updateButton(context)],
        );
      },
    );
  }

  /// 各ストアのアプリページに遷移するボタン
  static CupertinoDialogAction _updateButton(BuildContext context) {
    const text = 'アップデート';

    return CupertinoDialogAction(
      child: const Text(text),
      onPressed: () => _onPressed(context),
    );
  }

  static Future<void> _onPressed(BuildContext context) async {
    // URLを作成
    final storeUrl =
        Platform.isIOS ? urls.appStoreUrl : urls.googlePlayStoreUrl;
    final url = Uri.parse(storeUrl);

    // ストアページを開く
    if (await canLaunchUrl(Uri.parse(storeUrl))) {
      await launchUrl(url);
    } else {
      const content = '指定されたURLのページを開けませんでした。';
      MyAlertDialog.showError(context, content);
    }
  }
}
