import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 有料プラン項目のUIを作成する
class PaidPlan extends StatelessWidget {
  const PaidPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: texts.paidPlanTitle),
        SettingItem(
          independenceItem: true,
          leadingIcon: Icons.hide_image_outlined,
          itemName: texts.paidPlanItem,
          onTap: () => Navigator.pushNamed(context, '/billing'),
        ),
      ],
    );
  }
}
