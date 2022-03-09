import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:get/get.dart';

class BarcodeScanController extends GetxController {
  ScanResult _scanResult = ScanResult();
  ScanResult get scanResult => _scanResult;

  @override
  void onInit() {
    scanQR();
    super.onInit();
  }

  scanQR() async {
    _scanResult = await BarcodeScanner.scan();
    update();
  }
}
