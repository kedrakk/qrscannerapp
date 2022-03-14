import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/utils/colors.dart';

class QRGenerator extends GetxController {
  String _qrResult = "";
  String get qrResult => _qrResult;

  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get qrTextController => _textEditingController;

  Color _suffixIconColor = Get.theme.scaffoldBackgroundColor;
  Color get suffixIconColor => _suffixIconColor;

  @override
  void onInit() {
    if (_textEditingController.text.isNotEmpty) {
      _suffixIconColor = MyColor.white;
    }
    super.onInit();
  }

  void generateQR() {
    _qrResult = _textEditingController.text;
    update();
  }

  void textOnchange(String txt) {
    if (txt.isEmpty) {
      _qrResult = "";
      _suffixIconColor = Colors.transparent;
    } else {
      _suffixIconColor = MyColor.white;
    }
    update();
  }

  void clearKeywords() {
    if (_textEditingController.text.isNotEmpty) {
      _textEditingController.clear();
      update();
    }
  }
}
