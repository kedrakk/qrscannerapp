import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/screen/qr_pages/generate_qr.dart';
import 'package:qr_scanner_app/service/barcode_scan_controller.dart';
import 'package:qr_scanner_app/utils/colors.dart';

class QRActionPage extends StatelessWidget {
  const QRActionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY QR"),
        actions: [
          IconButton(
            onPressed: () {},
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
            GetBuilder<BarcodeScanController>(
              init: BarcodeScanController(),
              builder: (controller) {
                if (!controller.scanResult.isBlank!) {
                  return Column(
                    children: [
                      Text(
                        controller.scanResult.rawContent,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 10,
                      ),
                      ScanNewButton(
                        onPressed: () => controller.scanQR(),
                      ),
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    ScanNewButton(
                      onPressed: () => controller.scanQR(),
                    ),
                  ],
                );
              },
            ),
            TextButton.icon(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  MyColor.white,
                ),
              ),
              onPressed: () => Get.to(() => const GenerateQRPage()),
              icon: const Icon(Icons.qr_code),
              label: const Text(
                "Generate QR",
              ),
            ),
          ],
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
      label: const Text(
        "Scan New",
      ),
    );
  }
}
