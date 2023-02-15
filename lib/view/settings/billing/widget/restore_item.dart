import '../../../../constant/texts.dart' as texts;
import '../../../../importer.dart';

/// 復元処理を行う項目
class RestoreItem extends ConsumerWidget {
  const RestoreItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingItem(
      bottomItem: true,
      itemName: texts.restoreItem,
      leadingIcon: null,
      trailing: const SizedBox.shrink(),
      onTap: _onTap,
    );
  }

  Future<void> _onTap() async {}
}
