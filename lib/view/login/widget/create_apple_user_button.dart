import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// AppleでFirebaseのユーザーを作成するボタン
class CreateAppleUserButton extends ConsumerWidget {
  const CreateAppleUserButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppleSignInButton(
      text: texts.createAppleUserButton,
      onPressed: () {},
    );
  }
}
