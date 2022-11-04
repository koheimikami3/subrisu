import '../../constant/paths.dart' as paths;
import '../../importer.dart';

/// Googleでサインインするボタン
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text; // ボタンテキスト
  final VoidCallback onPressed; // ボタンタップ時の動作

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      iconImagePath: paths.googleIconPath,
      text: text,
      textColor: Colors.black54,
      backgroundColor: Colors.white,
      border: Border.all(width: 1, color: Colors.black26),
      onPressed: onPressed,
    );
  }
}
