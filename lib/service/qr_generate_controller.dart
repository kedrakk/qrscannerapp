import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QRGenerator extends GetxController {
  String _qrResult = "";
  String get qrResult => _qrResult;

  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get qrTextController => _textEditingController;

  void generateQR() {
    _qrResult = _textEditingController.text;
    update();
  }

  void textOnchange(String txt) {}
}
