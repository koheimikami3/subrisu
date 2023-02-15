import '../../../constant/exceptions.dart' as exceptions;
import '../../../constant/texts.dart' as texts;
import '../../../constant/urls.dart' as urls;
import '../../../importer.dart';

/// サポート項目リストのUIを作成する
class Supports extends StatelessWidget {
  const Supports({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: texts.supportsTitle),
        SettingItem(
          topItem: true,
          itemName: texts.reviewItem,
          leadingIcon: Icons.rate_review_outlined,
          trailing: const SizedBox.shrink(),
          onTap: () => _onReviewTap(context),
        ),
        SettingItem(
          middleItem: true,
          itemName: texts.shareItem,
          leadingIcon: Icons.share_outlined,
          trailing: const SizedBox.shrink(),
          onTap: _onShareTap,
        ),
        SettingItem(
          middleItem: true,
          leadingIcon: Icons.description_outlined,
          itemName: texts.tosItem,
          onTap: () => Navigator.pushNamed(context, '/tos'),
        ),
        SettingItem(
          bottomItem: true,
          leadingIcon: Icons.verified_user_outlined,
          itemName: texts.privacyPolicyItem,
          onTap: () => Navigator.pushNamed(context, '/privacyPolicy'),
        ),
      ],
    );
  }

  /// レビュー画面を呼び出す
  Future<void> _onReviewTap(BuildContext context) async {
    final inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      await inAppReview.openStoreListing(appStoreId: urls.appStoreId);
    } else {
      final message = exceptions.messageMap[exceptions.openReview];
      MyAlertDialog.showError(context, message!);
    }
  }

  /// シェア画面を呼び出す
  Future<void> _onShareTap() => Share.share(texts.shareText);
}
