import '../../../constant/paths.dart' as paths;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// Appleでサインインするボタン
class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      iconImagePath: paths.appleIconPath,
      text: texts.appleSignInButton,
      textColor: Colors.white,
      backgroundColor: Colors.black,
      border: null,
      onPressed: () {},
    );
  }
}
