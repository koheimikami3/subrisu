import 'package:subrisu/importer.dart';

/// Googleでサインインするボタン
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      iconImagePath: Configs.googleIconImagePath,
      text: Texts.googleSignInButton,
      textColor: Colors.black54,
      backgroundColor: Colors.white,
      border: Border.all(width: 2, color: Colors.black26),
      onPressed: () {},
    );
  }
}
