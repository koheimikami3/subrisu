import '../../../importer.dart';

/// アプリのレビュー画面を開くタイル
class OpenAppReviewTile extends ConsumerWidget {
  const OpenAppReviewTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyListTile(
      position: TilePosition.top,
      name: AppLocalizations.of(context)!.reviewItem,
      leadingIcon: Icons.rate_review_outlined,
      onTap: () async {
        final inAppReview = ref.read(inAppReviewProvider);

        if (await inAppReview.isAvailable()) {
          await inAppReview.openStoreListing(appStoreId: AppUrls.appStoreId);
        } else {
          showErrorDialog(
            context,
            AppLocalizations.of(context)!.openReviewError,
          );
        }
      },
    );
  }
}
