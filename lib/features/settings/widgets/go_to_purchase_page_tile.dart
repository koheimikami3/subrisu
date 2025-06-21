import '../../../importer.dart';

/// 課金画面に遷移するタイル
class GoToPurchasePageTile extends StatelessWidget {
  const GoToPurchasePageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.purchaseItemsTitle),
        MyListTile(
          position: TilePosition.independence,
          leadingIcon: Icons.hide_image_outlined,
          name: AppLocalizations.of(context)!.purchaseItem,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const PurchasePage()),
            );
          },
        ),
      ],
    );
  }
}
