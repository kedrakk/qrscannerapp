import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_app/screen/qr_pages/scanner_widgets.dart';
import 'package:qr_scanner_app/service/controllers/qrcontrollers/barcode_scan_with_mobile_scanner_controller.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import '../../generated/locales.g.dart';
import 'package:qr_scanner_app/utils/extensions.dart';

class QRScannerWithMobileScannerPage extends StatefulWidget {
  const QRScannerWithMobileScannerPage({super.key});

  @override
  State<QRScannerWithMobileScannerPage> createState() =>
      _QRScannerWithMobileScannerPageState();
}

class _QRScannerWithMobileScannerPageState
    extends State<QRScannerWithMobileScannerPage> with WidgetsBindingObserver {
  final MobileScannerController _mobileScannerController =
      MobileScannerController(
    autoStart: false,
    torchEnabled: true,
    useNewCameraSelector: true,
  );
  late BarcodeScanWithMobileScannerController
      barcodeScanWithMobileScannerController;

  Barcode? _barcode;
  StreamSubscription<Object?>? _subscription;

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      _barcode = barcodes.barcodes.firstOrNull;
      if (_barcode != null) {
        barcodeScanWithMobileScannerController.scanQR(
          _barcode!.rawValue!,
          _barcode!.type.name,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    barcodeScanWithMobileScannerController =
        Get.put(BarcodeScanWithMobileScannerController());
    WidgetsBinding.instance.addObserver(this);

    _subscription = _mobileScannerController.barcodes.listen(_handleBarcode);

    unawaited(_mobileScannerController.start());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_mobileScannerController.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        _subscription =
            _mobileScannerController.barcodes.listen(_handleBarcode);

        unawaited(_mobileScannerController.start());
      case AppLifecycleState.inactive:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(_mobileScannerController.stop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BarcodeScanWithMobileScannerController>(
      init: barcodeScanWithMobileScannerController,
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
                  controller: _mobileScannerController,
                  errorBuilder: (context, error, child) {
                    return ScannerErrorWidget(error: error);
                  },
                )
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              controller.qrCode,
                            ),
                          ),
                          ClipboardWidget(
                            textToCopy: controller.qrCode,
                          ),
                        ],
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
            backgroundColor: controller.qrCode.isNotEmpty
                ? MyColor.white
                : Colors.transparent,
            tooltip: "Scan New",
            child: Icon(
              Icons.qr_code_scanner,
              color: controller.qrCode.isNotEmpty
                  ? Get.theme.scaffoldBackgroundColor
                  : Colors.transparent,
            ),
          ),
        );
      }),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    await _mobileScannerController.dispose();
  }
}
