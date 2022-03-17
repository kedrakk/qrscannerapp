import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/utils/colors.dart';

void showEmptyTextDialog() {
  Get.defaultDialog(
    title: "OOPS...",
    middleText: "Please enter the text you want to generate first!",
    confirm: ElevatedButton.icon(
      onPressed: () => Get.back(),
      icon: const Icon(Icons.check),
      label: const Text(
        "OK",
      ),
    ),
    titlePadding: const EdgeInsets.all(10),
    backgroundColor: MyColor.white,
    titleStyle: TextStyle(color: Get.theme.scaffoldBackgroundColor),
    middleTextStyle: TextStyle(color: Get.theme.scaffoldBackgroundColor),
  );
}

void showInvalidQRDialog() {
  Get.defaultDialog(
    title: "OOPS...",
    middleText: "Please select the valid QR or Barcode Image Format",
    confirm: ElevatedButton.icon(
      onPressed: () => Get.back(),
      icon: const Icon(Icons.check),
      label: const Text(
        "OK",
      ),
    ),
    titlePadding: const EdgeInsets.all(10),
    backgroundColor: MyColor.white,
    titleStyle: TextStyle(color: Get.theme.scaffoldBackgroundColor),
    middleTextStyle: TextStyle(color: Get.theme.scaffoldBackgroundColor),
  );
}
