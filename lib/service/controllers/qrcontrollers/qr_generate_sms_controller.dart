import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:qr_scanner_app/widgets/snackbars.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../../../model/history_result.dart';

class QRSMSGenerator extends GetxController {
  String _qrResult = "";
  String get qrResult => _qrResult;

  final TextEditingController _phoneContoller = TextEditingController();
  TextEditingController get phoneContoller => _phoneContoller;

  final TextEditingController _smsContoller = TextEditingController();
  TextEditingController get smsController => _smsContoller;

  final FocusNode smsFoucs = FocusNode();

  Color _phoneSuffixIconColor = Get.theme.scaffoldBackgroundColor;
  Color get phoneSuffixIconColor => _phoneSuffixIconColor;

  Color _smsSuffixIconColor = Get.theme.scaffoldBackgroundColor;
  Color get smsSuffixIconColor => _smsSuffixIconColor;

  final ScreenshotController _screenshotController = ScreenshotController();
  ScreenshotController get screenshotController => _screenshotController;

  @override
  void onInit() {
    if (_phoneContoller.text.isNotEmpty) {
      _phoneSuffixIconColor = MyColor.white;
    }
    if (_smsContoller.text.isNotEmpty) {
      _smsSuffixIconColor = MyColor.white;
    }
    super.onInit();
  }

  void generateQRSingle(String type) {
    debugPrint(type);
    _qrResult = "SMSTO:${_phoneContoller.text}:${_smsContoller.text}";
    HistoryResult historyResult = HistoryResult(
      leadingIcon: "BarcodeType.${type.toLowerCase()}",
      resultName: _qrResult,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _storeData(historyResult);
    update();
  }

  void textOnchange(String txt, String inputType) {
    if (txt.isEmpty) {
      _qrResult = "";
      if (inputType == "phone") {
        _phoneSuffixIconColor = Colors.transparent;
      } else {
        _smsSuffixIconColor = Colors.transparent;
      }
    } else {
      if (inputType == "phone") {
        _phoneSuffixIconColor = MyColor.white;
      } else {
        _smsSuffixIconColor = MyColor.white;
      }
    }
    update();
  }

  void clearKeywords(String type) {
    if (_phoneContoller.text.isNotEmpty && type == "phone") {
      _phoneContoller.clear();
      _phoneSuffixIconColor = Get.theme.scaffoldBackgroundColor;
    }
    if (_smsContoller.text.isNotEmpty && type == "sms") {
      _smsContoller.clear();
      _smsSuffixIconColor = Get.theme.scaffoldBackgroundColor;
    }
    _qrResult = "";
    update();
  }

  Future<File?> _captureImage() async {
    Uint8List? res = await _screenshotController.capture(
        delay: const Duration(milliseconds: 10));
    if (res != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imageName = "${DateTime.now().millisecondsSinceEpoch}_image";
      final imagePath = await File('${directory.path}/$imageName.png').create();
      await imagePath.writeAsBytes(res);
      return imagePath;
    }
    return null;
  }

  void saveImage() async {
    var captureFile = await _captureImage();
    if (captureFile != null) {
      var result = await ImageGallerySaver.saveFile(captureFile.path);
      if (result != null) {
        showGetSnackBar(LocaleKeys.success.tr, LocaleKeys.imagesavesuccess.tr);
      }
    }
  }

  void shareImage() async {
    var captureFile = await _captureImage();
    if (captureFile != null) {
      await Share.shareXFiles([XFile(captureFile.path)]);
    }
  }

  _storeData(HistoryResult historyResult) {
    var box = Hive.box('generatebox');
    if (box.length > 9) {
      box.deleteAt(0);
    }
    box.put(historyResult.timestamp, historyResult);
  }

  @override
  void onClose() {
    _phoneContoller.dispose();
    _smsContoller.dispose();
    super.onClose();
  }
}
