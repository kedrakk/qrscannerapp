// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:qr_scanner_app/service/controllers/adscontrollers/banner_ads_controller.dart';

// class ShowBannerAdsPage extends StatefulWidget {
//   const ShowBannerAdsPage({Key? key}) : super(key: key);

//   @override
//   State<ShowBannerAdsPage> createState() => _ShowBannerAdsPageState();
// }

// class _ShowBannerAdsPageState extends State<ShowBannerAdsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BannerAdsController>(
//       init: BannerAdsController(),
//       builder: ((controller) {
//         if (controller.isBannerReady) {
//           return Align(
//             alignment: Alignment.bottomCenter,
//             child: SizedBox(
//               width: controller.bannerAd?.size.width.toDouble(),
//               height: controller.bannerAd?.size.height.toDouble(),
//               child: AdWidget(
//                 ad: controller.bannerAd!,
//               ),
//             ),
//           );
//         } else {
//           return const SizedBox.shrink();
//         }
//       }),
//     );
//   }
// }
