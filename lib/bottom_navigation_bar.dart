import 'package:flutter/foundation.dart';

import 'constant/configs.dart' as configs;
import 'constant/texts.dart' as texts;
import 'importer.dart';

/// BottomNavigationBar
class MyBottomNavigationBar extends ConsumerStatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  ConsumerState<MyBottomNavigationBar> createState() =>
      _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends ConsumerState<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  final _myBanner = BannerAd(
    adUnitId: Platform.isIOS
        ? kReleaseMode
            ? configs.iOSReleaseAdId
            : configs.iOSDebugAdId
        : kReleaseMode
            ? configs.androidDebugAdId
            : configs.androidDebugAdId,
    size: AdSize.fullBanner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );

  final _pages = [
    const SubscriptionListPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();

    // バナー広告を読み込む
    _myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    final purchaseStatus = ref.watch(purchaseStatusNotifierProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
          ),
          if (purchaseStatus == PurchaseStatus.inactive) _bannerAd(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [_list(), _settings()],
      ),
    );
  }

  /// ナビゲーションをタップ時、対応する画面を切り替える
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// バナー広告
  SizedBox _bannerAd() {
    return SizedBox(
      height: _myBanner.size.height.toDouble(),
      width: double.infinity,
      child: AdWidget(ad: _myBanner),
    );
  }

  /// 「リスト」のナビゲーション
  BottomNavigationBarItem _list() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: texts.subscriptionListNavi,
    );
  }

  /// 「設定」のナビゲーション
  BottomNavigationBarItem _settings() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: texts.settingsNavi,
    );
  }
}
