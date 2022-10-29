import 'package:subrisu/importer.dart';
import '../constant/texts.dart' as texts;

/// ボトムナビゲーションバーのUIを作成する
class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  int _selectedIndex = 0;

  final _pageList = [
    const ListPage(),
    const SettingsPage(),
  ];

  /// 画面を切り替える
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    getStartData();
  }

  Future<void> getStartData() async {
    // アプリバージョンを取得し、プロバイダに保存
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    ref.watch(appVersionProvider.notifier).state = version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _onItemTapped(index),
        currentIndex: _selectedIndex,
        items: [
          _list(),
          _settings(),
        ],
      ),
    );
  }

  /// 「リスト」を表示する
  BottomNavigationBarItem _list() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: texts.listNavi,
    );
  }

  /// 「設定」を表示する
  BottomNavigationBarItem _settings() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: texts.settingsNavi,
    );
  }
}
