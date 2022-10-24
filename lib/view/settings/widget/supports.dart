import 'package:subrisu/importer.dart';

/// サポート項目リストのUIを作成する
class Supports extends StatelessWidget {
  const Supports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: Texts.supportsTitle),
        SettingItem(
          topItem: true,
          itemName: Texts.reviewItem,
          leadingIcon: Icons.rate_review_outlined,
          trailing: const SizedBox.shrink(),
          onTap: () => _onReviewTap(),
        ),
        SettingItem(
          middleItem: true,
          itemName: Texts.shareItem,
          leadingIcon: Icons.share_outlined,
          trailing: const SizedBox.shrink(),
          onTap: () => _onShareTap(),
        ),
        SettingItem(
          middleItem: true,
          leadingIcon: Icons.description_outlined,
          itemName: Texts.tosItem,
          onTap: () => _onTosTap(context),
        ),
        SettingItem(
          bottomItem: true,
          leadingIcon: Icons.verified_user_outlined,
          itemName: Texts.privacyPolicyItem,
          onTap: () => _onPrivacyPolicyTap(context),
        ),
      ],
    );
  }

  /// レビュー画面を呼び出す
  void _onReviewTap() {}

  /// シェア画面を呼び出す
  Future<void> _onShareTap() async => await Share.share(Texts.shareText);

  /// 利用規約画面に遷移する
  void _onTosTap(BuildContext context) {}

  /// プライバシーポリシー画面に遷移する
  void _onPrivacyPolicyTap(BuildContext context) {}
}
