import '../../../constant/texts.dart' as texts;
import '../../../constant/urls.dart' as urls;
import '../../../importer.dart';

/// プライバシーポリシー画面
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RulePageBody(
      title: texts.privacyPolicyPage,
      url: urls.privacyPolicyUrl,
    );
  }
}
