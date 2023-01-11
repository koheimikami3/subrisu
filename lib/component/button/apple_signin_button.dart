import '../../constant/paths.dart' as paths;
import '../../importer.dart';

/// Appleでサインインするボタン
class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text; // ボタンテキスト
  final VoidCallback onPressed; // ボタンタップ時の動作

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      iconImagePath: paths.appleIconPath,
      text: text,
      textColor: Colors.white,
      backgroundColor: Colors.black,
      border: null,
      onPressed: onPressed,
    );
  }
}
