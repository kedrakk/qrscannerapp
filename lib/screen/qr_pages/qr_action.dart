import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/screen/qr_pages/generate_qr.dart';
import 'package:qr_scanner_app/service/barcode_scan_controller.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:scan/scan.dart';

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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              controller.qrCode,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          TextButton.icon(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                MyColor.white,
                              ),
                            ),
                            onPressed: () => controller.refreshNew(),
                            icon: const Icon(Icons.qr_code),
                            label: Text(
                              LocaleKeys.scannew.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
              TextButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    MyColor.white,
                  ),
                ),
                onPressed: () => Get.to(() => const GenerateQRPage()),
                icon: const Icon(Icons.qr_code),
                label: Text(
                  LocaleKeys.generateqr.tr,
                ),
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
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          MyColor.white,
        ),
      ),
      onPressed: onPressed,
      icon: const Icon(Icons.qr_code),
      label: Text(
        LocaleKeys.scannew.tr,
      ),
    );
  }
}
