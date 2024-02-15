import '../../../../../constant/texts.dart' as texts;
import '../../../../../importer.dart';

/// ログインエラーが発生したことを知らせるテキスト
class LoginError extends StatelessWidget {
  const LoginError({super.key});

  @override
  Widget build(BuildContext context) {
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
