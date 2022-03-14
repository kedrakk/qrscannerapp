import 'package:get/get.dart';
import 'package:scan/scan.dart';

class BarcodeScanController extends GetxController {
  final ScanController _controller = ScanController();
  ScanController get scanController => _controller;

  String _qrcode = '';
  String get qrCode => _qrcode;

  scanQR(String res) {
    _qrcode = res;
    update();
  }

  refreshNew() {
    _qrcode = '';
    update();
  }
}
