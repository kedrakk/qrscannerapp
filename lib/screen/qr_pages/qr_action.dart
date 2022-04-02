import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/service/controllers/qrcontrollers/barcode_scan_controller.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:scan/scan.dart';

import '../../service/controllers/adscontrollers/interstitial_ads_controller.dart';

class QRActionPage extends StatelessWidget {
  const QRActionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BarcodeScanController>(
      init: BarcodeScanController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.myqr.tr),
          actions: [
            IconButton(
              onPressed: () => controller.pickQRImage(),
              icon: const Icon(
                Icons.photo,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              controller.qrCode.isEmpty
                  ? Container(
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      height: MediaQuery.of(context).size.height * 1 / 3,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: ScanView(
                        controller: controller.scanController,
                        scanAreaScale: .9,
                        scanLineColor: Get.theme.scaffoldBackgroundColor,
                        onCapture: (data) => controller.scanQR(data),
                      ),
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          controller.qrCode,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
              ScanNewButton(
                onPressed: () => controller.refreshNew(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScanNewButton extends StatelessWidget {
  const ScanNewButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InterstitialAdsController>(
      init: InterstitialAdsController(),
      builder: ((controller) {
        return TextButton.icon(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              MyColor.white,
            ),
          ),
          onPressed: () {
            if (controller.isInterstitialAdReady &&
                controller.interstitialAds != null) {
              controller.interstitialAds?.show();
            }
            onPressed();
          },
          icon: const Icon(Icons.qr_code),
          label: Text(
            LocaleKeys.scannew.tr,
          ),
        );
      }),
    );
  }
}
