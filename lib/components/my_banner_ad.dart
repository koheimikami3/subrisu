import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:subrisu/enums/purchase_status.dart';
import 'package:subrisu/env/env.dart';
import 'package:subrisu/providers/purchase_status_provider.dart';

/// バナー広告
class MyBannerAd extends ConsumerStatefulWidget {
  const MyBannerAd({super.key});

  @override
  ConsumerState<MyBannerAd> createState() => _MyBannerAdState();
}

class _MyBannerAdState extends ConsumerState<MyBannerAd> {
  static const AdSize _adSize = AdSize.fullBanner;

  /// 実行プラットフォームとビルドモードに応じた広告ユニットIDを返す
  static String get _adUnitId {
    if (Platform.isIOS) {
      return kReleaseMode ? Env.iOSReleaseAdId : Env.iOSDebugAdId;
    } else {
      return kReleaseMode ? Env.androidReleaseAdId : Env.androidDebugAdId;
    }
  }

  late final _myBanner = BannerAd(
    adUnitId: _adUnitId,
    size: _adSize,
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
  void dispose() {
    _myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final purchaseStatus = ref.watch(purchaseStatusNotifierProvider);

    return purchaseStatus == PurchaseStatus.active
        ? const SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: SizedBox(
              height: _adSize.height.toDouble(),
              width: double.infinity,
              child: AdWidget(ad: _myBanner),
            ),
          );
  }
}
