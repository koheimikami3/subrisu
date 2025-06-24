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
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.forcedUpdateDialogTitle),
      content: Text(AppLocalizations.of(context)!
          .forcedUpdateDialogContent(forcedUpdateVersion)),
      actions: [
        _openStoreUrlButton(context),
      ],
    );
  }

  /// ストアのアプリページを開く
  Widget _openStoreUrlButton(BuildContext context) {
    return MyFilledButton(
      text: AppLocalizations.of(context)!.openStoreUrlButton,
      onPressed: () async {
        final url = Uri.parse(
          Platform.isIOS ? AppUrls.appStore : AppUrls.googlePlayStore,
        );

        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          showErrorDialog(context, AppLocalizations.of(context)!.openUrlError);
        }
      },
    );
  }
}
