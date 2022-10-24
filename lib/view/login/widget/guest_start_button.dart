import 'package:subrisu/importer.dart';

/// ゲストで始めるボタン
class GuestStartButton extends ConsumerWidget {
  const GuestStartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => _onTap(context, ref),
      highlightColor: Colors.black26,
      splashColor: Colors.transparent,
      child: Text(
        Texts.guestStartButton,
        style: TextStyle(
          fontSize: 15.sp,
          color: Configs.appColor,
        ),
      ),
    );
  }

  /// 匿名ユーザーを作成し、ボトムナビゲーションバーを経由してリスト画面に遷移する
  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    final auth = FirebaseAuth.instance;
    final repository = ref.watch(userViewModelProvider);

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    // 匿名認証を実施
    final credential = await auth.signInAnonymously();

    // 匿名認証の結果から現在のユーザーIDを取得
    final anonAuthId = credential.user!.uid;

    // ユーザーを作成
    // 匿名認証IDをユーザーIDとする
    await repository.create(anonAuthId);

    // ユーザーIDをプロバイダに保存
    ref.watch(userIdProvider.notifier).state = anonAuthId;

    // プログレスダイアログを閉じる
    // ignore: use_build_context_synchronously
    Navigator.pop(context);

    // ボトムナビゲーションバーを経由してリスト画面に遷移
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/bottomNav');
  }
}
