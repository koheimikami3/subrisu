import 'package:subrisu/importer.dart';

/// Appleでサインインするボタン
class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      iconImagePath: Configs.appleIconImagePath,
      text: Texts.appleSignInButton,
      textColor: Colors.white,
      backgroundColor: Colors.black,
      border: null,
      onPressed: () {},
    );
  }
}
