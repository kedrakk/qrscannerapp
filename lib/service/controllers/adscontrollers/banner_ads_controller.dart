import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_scanner_app/utils/ads_helper.dart';

class BannerAdsController extends GetxController {
  BannerAd? _bannerAd;
  BannerAd? get bannerAd => _bannerAd;

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
          update();
        },
      ),
    );
    _bannerAd?.load();
    update();
  }

  refreshBannerAds() {
    if (_bannerAd != null) {
      _bannerAd?.dispose();
    }
    _getBannerAd();
  }

  @override
  void onInit() {
    refreshBannerAds();
    super.onInit();
  }

  @override
  void onClose() {
    if (_bannerAd != null) {
      _bannerAd?.dispose();
    }
    super.onClose();
  }
}
