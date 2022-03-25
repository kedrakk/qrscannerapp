import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../utils/ads_helper.dart';

class InterstitialAdsController extends GetxController {
  InterstitialAd? _interstitialAd;
  InterstitialAd? get interstitialAds => _interstitialAd;

  bool _isInterstitialAdReady = false;
  bool get isInterstitialAdReady => _isInterstitialAdReady;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              debugPrint("doing nothing");
            },
          );
          _isInterstitialAdReady = true;
          update();
        },
        onAdFailedToLoad: (err) {
          _isInterstitialAdReady = false;
          update();
        },
      ),
    );
  }

  @override
  void onInit() {
    _loadInterstitialAd();
    super.onInit();
  }

  @override
  void onClose() {
    _interstitialAd?.dispose();
    super.onClose();
  }
}
