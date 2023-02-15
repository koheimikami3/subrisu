import '../../../../constant/colors.dart' as colors;
import '../../../../importer.dart';

/// 利用規約画面・プライバシーポリシー画面の内容
class RulePageBody extends ConsumerStatefulWidget {
  const RulePageBody({
    super.key,
    required this.title,
    required this.url,
  });

  final String title; // 画面タイトル
  final String url; // 規約のURL

  @override
  ConsumerState<RulePageBody> createState() => _RulePageBodyState();
}

class _RulePageBodyState extends ConsumerState<RulePageBody> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            backgroundColor: isDark
                ? colors.darkBackgroundColor
                : colors.lightBackgroundColor,
            onPageFinished: (_) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          _isLoading
              ? const Center(child: LoadingIndicator())
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
