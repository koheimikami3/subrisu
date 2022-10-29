import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// サポート項目リストのUIを作成する
class Supports extends StatelessWidget {
  const Supports({Key? key}) : super(key: key);

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
          onTap: () => _onReviewTap(),
        ),
        SettingItem(
          middleItem: true,
          itemName: texts.shareItem,
          leadingIcon: Icons.share_outlined,
          trailing: const SizedBox.shrink(),
          onTap: () => _onShareTap(),
        ),
        SettingItem(
          middleItem: true,
          leadingIcon: Icons.description_outlined,
          itemName: texts.tosItem,
          onTap: () => _onTosTap(context),
        ),
        SettingItem(
          bottomItem: true,
          leadingIcon: Icons.verified_user_outlined,
          itemName: texts.privacyPolicyItem,
          onTap: () => _onPrivacyPolicyTap(context),
        ),
      ],
    );
  }

  /// レビュー画面を呼び出す
  void _onReviewTap() {}

  /// シェア画面を呼び出す
  Future<void> _onShareTap() async => await Share.share(texts.shareText);

  /// 利用規約画面に遷移する
  void _onTosTap(BuildContext context) {}

  /// プライバシーポリシー画面に遷移する
  void _onPrivacyPolicyTap(BuildContext context) {}
}
