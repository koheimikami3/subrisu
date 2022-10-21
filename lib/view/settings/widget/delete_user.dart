import 'package:subrisu/importer.dart';

/// ユーザー削除項目のUIを作成する
class DeleteUserItem extends StatelessWidget {
  const DeleteUserItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: Texts.userDataTitle),
        SettingItem(
          independenceItem: true,
          itemName: Texts.deleteUserItem,
          textColor: Colors.red,
          leadingIcon: Icons.delete_outline,
          trailing: const SizedBox.shrink(),
          onTap: () => _onTap(context),
        ),
      ],
    );
  }

  /// ログイン画面に遷移する
  ///
  /// 今までの画面を全てウィジェットツリーから削除する
  void _onTap(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }
}
