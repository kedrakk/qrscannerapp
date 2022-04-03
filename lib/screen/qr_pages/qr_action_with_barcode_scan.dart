// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_scanner_app/generated/locales.g.dart';
// import 'package:qr_scanner_app/service/controllers/qrcontrollers/barcode_scan_with_barcode_scan_controller.dart';
// import 'package:qr_scanner_app/utils/colors.dart';

// import '../../service/controllers/adscontrollers/interstitial_ads_controller.dart';

// class QRActionWithBarcodeScanPage extends StatelessWidget {
//   const QRActionWithBarcodeScanPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BarcodeScanWithBarcodeScanController>(
//       init: BarcodeScanWithBarcodeScanController(),
//       builder: (controller) => Scaffold(
//         appBar: AppBar(
//           title: Text(LocaleKeys.myqr.tr),
//           actions: [
//             IconButton(
//               onPressed: () => controller.pickQRImage(),
//               icon: const Icon(
//                 Icons.photo,
//               ),
//             ),
//           ],
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: 100,
//                   minWidth: 100,
//                   maxHeight: MediaQuery.of(context).size.height * 1.3 / 2,
//                   maxWidth: MediaQuery.of(context).size.width,
//                 ),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 10.0,
//                     horizontal: 20,
//                   ),
//                   child: SingleChildScrollView(
//                     child: Text(
//                       controller.qrCode.isNotEmpty
//                           ? controller.qrCode
//                           : "Click the button below to scan qr or barcode",
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               ScanNewButton(
//                 onPressed: () => controller.scanQR(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ScanNewButton extends StatelessWidget {
//   const ScanNewButton({
//     Key? key,
//     required this.onPressed,
//   }) : super(key: key);
//   final Function onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<InterstitialAdsController>(
//       init: InterstitialAdsController(),
//       builder: ((controller) {
//         return TextButton.icon(
//           style: ButtonStyle(
//             foregroundColor: MaterialStateProperty.all(
//               MyColor.white,
//             ),
//           ),
//           onPressed: () {
//             if (controller.isInterstitialAdReady &&
//                 controller.interstitialAds != null) {
//               controller.interstitialAds?.show();
//             }
//             onPressed();
//           },
//           icon: const Icon(Icons.qr_code),
//           label: Text(
//             LocaleKeys.scannew.tr,
//           ),
//         );
//       }),
//     );
//   }
// }
