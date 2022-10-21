import 'package:subrisu/importer.dart';

/// ゲストで始めるボタン
class GuestStartButton extends StatelessWidget {
  const GuestStartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
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

  /// ボトムナビゲーションバーを経由してリスト画面に遷移する
  void _onTap(BuildContext context) {
    Navigator.pushNamed(context, '/bottomNav');
  }
}
