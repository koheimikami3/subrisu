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
          itemName: Texts.appReviewItem,
          leadingIcon: Icons.rate_review_outlined,
          trailing: const SizedBox.shrink(),
          onTap: () => _onTap(context),
        ),
        SettingItem(
          middleItem: true,
          itemName: Texts.appShareItem,
          leadingIcon: Icons.share_outlined,
          trailing: const SizedBox.shrink(),
          onTap: () => _onTap(context),
        ),
        SettingItem(
          middleItem: true,
          leadingIcon: Icons.description_outlined,
          itemName: Texts.tosItem,
          onTap: () => _onTap(context),
        ),
        SettingItem(
          bottomItem: true,
          leadingIcon: Icons.verified_user_outlined,
          itemName: Texts.privacyPolicyItem,
          onTap: () => _onTap(context),
        ),
      ],
    );
  }

  /// 有料プラン画面に遷移する
  void _onTap(BuildContext context) {}
}
