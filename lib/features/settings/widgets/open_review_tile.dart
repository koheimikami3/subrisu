import '../../../constant/texts.dart' as texts;
import '../../../constant/urls.dart' as urls;
import '../../../importer.dart';

/// アプリのレビュー画面を開くタイル
class OpenReviewTile extends ConsumerWidget {
  const OpenReviewTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyListTile(
      position: ItemPosition.top,
      name: texts.reviewItem,
      leadingIcon: Icons.rate_review_outlined,
      onTap: () async {
        final inAppReview = ref.read(inAppReviewProvider);

        if (await inAppReview.isAvailable()) {
          await inAppReview.openStoreListing(appStoreId: urls.appStoreId);
        } else {
          MyAlertDialog.showError(context, texts.openReviewError);
        }
      },
    );
  }
}
