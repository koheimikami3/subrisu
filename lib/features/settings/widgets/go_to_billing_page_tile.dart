import '../../../importer.dart';

/// 課金画面に遷移するタイル
class GoToBillingPageTile extends StatelessWidget {
  const GoToBillingPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.billingItemsTitle),
        MyListTile(
          position: ItemPosition.independence,
          leadingIcon: Icons.hide_image_outlined,
          name: AppLocalizations.of(context)!.billingItem,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const BillingPage()),
            );
          },
        ),
      ],
    );
  }
}
