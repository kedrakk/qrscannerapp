import 'package:get/get.dart';
import 'package:qr_scanner_app/service/controllers/adscontrollers/ads_controller.dart';
import 'package:qr_scanner_app/service/controllers/common_controllers/box_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BoxController>(BoxController());
    Get.put<AdsController>(AdsController());
  }
}
