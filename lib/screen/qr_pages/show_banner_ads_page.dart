import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_scanner_app/service/controllers/adscontrollers/banner_ads_controller.dart';

class ShowBannerAdsPage extends StatelessWidget {
  const ShowBannerAdsPage({
    Key? key,
    required this.bannerAdsId,
  }) : super(key: key);
  final String bannerAdsId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerAdsController>(
      init: BannerAdsController(adsId: bannerAdsId),
      builder: ((controller) {
        if (controller.isBannerReady) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: controller.bannerAd.size.width.toDouble(),
              height: controller.bannerAd.size.height.toDouble(),
              child: AdWidget(
                ad: controller.bannerAd,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
