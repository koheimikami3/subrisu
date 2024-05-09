import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 課金画面に遷移するタイル
class MoveBillingPageTile extends StatelessWidget {
  const MoveBillingPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: texts.billingItemsTitle),
        MyListTile(
          position: ItemPosition.independence,
          leadingIcon: Icons.hide_image_outlined,
          name: texts.billingItem,
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
