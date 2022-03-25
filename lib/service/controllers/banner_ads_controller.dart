import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../utils/ads_helper.dart';

class BannerAdsController extends GetxController {
  late BannerAd _bannerAd;
  BannerAd get bannerAd => _bannerAd;

  bool _isBannerReady = false;
  bool get isBannerReady => _isBannerReady;

  _getBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          _isBannerReady = true;
          update();
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
    update();
  }

  @override
  void onInit() {
    _getBannerAd();
    super.onInit();
  }

  @override
  void onClose() {
    _bannerAd.dispose();
    super.onClose();
  }
}
