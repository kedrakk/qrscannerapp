import 'package:get/get.dart';
import 'package:qr_scanner_app/utils/colors.dart';

void showGetSnackBar(String title, String msg) {
  Get.snackbar(title, msg,
      backgroundColor: MyColor.white,
      colorText: Get.theme.scaffoldBackgroundColor);
}
