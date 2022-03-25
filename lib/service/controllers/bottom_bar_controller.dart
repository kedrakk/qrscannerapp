import 'package:get/get.dart';
import 'package:qr_scanner_app/screen/qr_pages/history_page.dart';
import 'package:qr_scanner_app/screen/qr_pages/qr_action.dart';
import 'package:qr_scanner_app/screen/setting_page.dart';

class BottomBarController extends GetxController {
  final pages = [
    const QRHistoryPage(),
    const QRActionPage(),
    const SettingPage(),
  ];
  int _pageIndex = 1;
  int get pageIndex => _pageIndex;

  void changePage(int _newIndex) {
    _pageIndex = _newIndex;
    update();
  }
}
