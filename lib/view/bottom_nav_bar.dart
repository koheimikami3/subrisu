import 'package:flutter/foundation.dart';

import 'package:subrisu/importer.dart';
import '../constant/configs.dart' as configs;
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

  final BannerAd _myBanner = BannerAd(
    adUnitId: Platform.isIOS
        ? kReleaseMode
            ? configs.iOSDebugAdId
            : configs.iOSDebugAdId
        : kReleaseMode
            ? configs.androidDebugAdId
            : configs.androidDebugAdId,
    size: AdSize.fullBanner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );

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

    // バナー広告を読み込む
    _myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _pageList.elementAt(_selectedIndex)),
          _bannerAd(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
        items: [_list(), _settings()],
      ),
    );
  }

  /// バナー広告を表示する
  SizedBox _bannerAd() {
    return SizedBox(
      height: _myBanner.size.height.toDouble(),
      width: double.infinity,
      child: AdWidget(ad: _myBanner),
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
