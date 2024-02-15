import '../../../constant/texts.dart' as texts;
import '../../../constant/urls.dart' as urls;
import '../../../importer.dart';

/// 利用規約画面
class TosPage extends StatelessWidget {
  const TosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RulePageBody(
      title: texts.tosPage,
      url: urls.tosUrl,
    );
  }
}
