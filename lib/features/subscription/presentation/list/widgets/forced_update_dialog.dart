import '../../../../../constant/texts.dart' as texts;
import '../../../../../constant/urls.dart' as urls;
import '../../../../../importer.dart';

/// アップデートを促すダイアログ
class ForcedUpdateDialog extends StatelessWidget {
  const ForcedUpdateDialog({
    super.key,
    required this.forcedUpdateVersion,
  });

  final String forcedUpdateVersion; // 強制アップデートバージョン

  @override
  Widget build(BuildContext context) {
    const title = 'アップデートのお知らせ';
    final content = '新しいバージョンのアプリが利用可能です。'
        '今すぐバージョン$forcedUpdateVersionにアップデートしてください。';

    return AlertDialog(
      title: const Text(title),
      content: Text(content),
      actions: [
        _openStoreUrlButton(context),
      ],
    );
  }

  /// ストアのアプリページを開く
  Widget _openStoreUrlButton(BuildContext context) {
    return MyFilledButton(
      text: texts.openStoreUrlButton,
      onPressed: () async {
        final url = Uri.parse(
          Platform.isIOS ? urls.appStoreUrl : urls.googlePlayStoreUrl,
        );

        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          MyAlertDialog.showError(context, texts.openUrlError);
        }
      },
    );
  }
}
