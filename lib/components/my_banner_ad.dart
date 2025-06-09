import 'package:flutter/foundation.dart';

import '../../importer.dart';
import '../constants/configs.dart' as configs;

/// バナー広告
class MyBannerAd extends ConsumerStatefulWidget {
  const MyBannerAd({super.key});

  @override
  ConsumerState<MyBannerAd> createState() => _MyBannerAdState();
}

class _MyBannerAdState extends ConsumerState<MyBannerAd> {
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

  @override
  void initState() {
    super.initState();

    // バナー広告を読み込む
    _myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    final purchaseStatus = ref.watch(purchaseStatusNotifierProvider);

    return purchaseStatus == PurchaseStatus.active
        ? const SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: SizedBox(
              height: BannerAd(
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
              ).size.height.toDouble(),
              width: double.infinity,
              child: AdWidget(ad: _myBanner),
            ),
          );
  }
}
