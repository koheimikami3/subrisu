import 'package:subrisu/importer.dart';

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
      bottomNavigationBar: Theme(
        data: ThemeData(
          // リップルエフェクトを無効化
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          onTap: (index) => _onItemTapped(index),
          iconSize: 30,
          selectedFontSize: 12.sp,
          unselectedFontSize: 12.sp,
          currentIndex: _selectedIndex,
          fixedColor: Colors.black,
          items: [
            _list(),
            _settings(),
          ],
        ),
      ),
    );
  }

  /// 「リスト」を表示する
  BottomNavigationBarItem _list() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: Texts.listNavi,
    );
  }

  /// 「設定」を表示する
  BottomNavigationBarItem _settings() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: Texts.settingsNavi,
    );
  }
}
