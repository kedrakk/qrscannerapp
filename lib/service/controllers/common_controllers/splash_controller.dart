import 'dart:async';
import 'package:get/get.dart';
import 'package:qr_scanner_app/screen/home.dart';

class SplashController extends GetxController {
  late Timer _timer;

  @override
  void onInit() {
    _timer = Timer(const Duration(milliseconds: 5000), () {
      Get.offAll(() => const HomePage());
    });
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
