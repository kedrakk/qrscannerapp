import 'package:get/get.dart';
import 'package:qr_scanner_app/screen/qr_pages/generate_qr_select.dart';
import 'package:qr_scanner_app/screen/qr_pages/history_page.dart';
import 'package:qr_scanner_app/screen/qr_pages/qr_action_with_mobilescanner.dart';
import 'package:qr_scanner_app/screen/setting_page.dart';

class BottomBarController extends GetxController {
  final pages = [
    const QRHistoryPage(),
    const QRScannerWithMobileScannerPage(),
    GenerateQRSelectPage(),
    const SettingPage(),
  ];
  int _pageIndex = 1;
  int get pageIndex => _pageIndex;

  void changePage(int newIndex) {
    _pageIndex = newIndex;
    update();
  }
}
