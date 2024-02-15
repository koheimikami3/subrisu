import '../../../../../constant/texts.dart' as texts;
import '../../../../importer.dart';

/// ログインエラー画面のScaffoldBody
class LoginErrorPageBody extends StatelessWidget {
  const LoginErrorPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SubrisuImage(color: Colors.red),
          _text(),
        ],
      ),
    );
  }

  /// テキスト
  Widget _text() {
    return Text(
      texts.loginError,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15.sp,
        color: Colors.red,
      ),
    );
  }
}
