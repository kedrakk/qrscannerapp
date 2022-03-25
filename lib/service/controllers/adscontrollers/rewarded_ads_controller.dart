import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../utils/ads_helper.dart';

class RewardedAdsController extends GetxController {
  RewardedAd? _rewardedAd;
  RewardedAd? get rewardedAd => _rewardedAd;

  bool _isRewardedAdReady = false;
  bool get isRewardedAdReady => _isRewardedAdReady;

  @override
  void onInit() {
    _loadRewardedAd();
    super.onInit();
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              _isRewardedAdReady = false;
              update();
              _loadRewardedAd();
            },
          );
          _isRewardedAdReady = true;
          update();
        },
        onAdFailedToLoad: (err) {
          _isRewardedAdReady = false;
          update();
        },
      ),
    );
  }

  @override
  void onClose() {
    _rewardedAd?.dispose();
    super.onClose();
  }
}
