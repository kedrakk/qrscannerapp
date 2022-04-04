import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_app/service/controllers/qrcontrollers/barcode_scan_with_mobile_scanner_controller.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import '../../generated/locales.g.dart';
import 'package:qr_scanner_app/utils/extensions.dart';

class QRScannerWithMobileScannerPage extends StatelessWidget {
  const QRScannerWithMobileScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BarcodeScanWithMobileScannerController>(
      init: BarcodeScanWithMobileScannerController(),
      builder: ((controller) {
        return Scaffold(
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
          body: controller.qrCode.isEmpty
              ? MobileScanner(
                  allowDuplicates: false,
                  onDetect: (barcode, args) {
                    final String? code = barcode.rawValue;
                    final String type = barcode.type.toString();
                    controller.scanQR(code!, type);
                  })
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          controller.codeType.barcodeType(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Text(
                          controller.qrCode,
                        ),
                      ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (controller.qrCode.isNotEmpty) {
                controller.refreshNew();
              }
            },
            child: Icon(
              Icons.qr_code_scanner,
              color: controller.qrCode.isNotEmpty
                  ? Get.theme.scaffoldBackgroundColor
                  : Colors.transparent,
            ),
            backgroundColor: controller.qrCode.isNotEmpty
                ? MyColor.white
                : Colors.transparent,
            tooltip: "Scan New",
          ),
        );
      }),
    );
  }
}
