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
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final isDarkMode = ref.read(darkModeNotifierProvider);

    _controller = WebViewController()
      ..setBackgroundColor(
        isDarkMode ? colors.darkBackgroundColor : colors.lightBackgroundColor,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          _isLoading
              ? const Center(child: LoadingIndicator())
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
