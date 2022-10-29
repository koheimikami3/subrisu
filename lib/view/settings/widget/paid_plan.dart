import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 有料プラン項目のUIを作成する
class PaidPlan extends StatelessWidget {
  const PaidPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: texts.paidPlanTitle),
        SettingItem(
          independenceItem: true,
          leadingIcon: Icons.hide_image_outlined,
          itemName: texts.paidPlanItem,
          onTap: () => _onTap(context),
        ),
      ],
    );
  }

  /// 有料プラン画面に遷移する
  void _onTap(BuildContext context) {}
}
