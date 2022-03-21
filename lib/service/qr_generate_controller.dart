import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:qr_scanner_app/widgets/snackbars.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QRGenerator extends GetxController {
  String _qrResult = "";
  String get qrResult => _qrResult;

  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get qrTextController => _textEditingController;

  Color _suffixIconColor = Get.theme.scaffoldBackgroundColor;
  Color get suffixIconColor => _suffixIconColor;

  final ScreenshotController _screenshotController = ScreenshotController();
  ScreenshotController get screenshotController => _screenshotController;

  @override
  void onInit() {
    if (_textEditingController.text.isNotEmpty) {
      _suffixIconColor = MyColor.white;
    }
    super.onInit();
  }

  void generateQR() {
    _qrResult = _textEditingController.text;
    _storeData(_qrResult);
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
      _suffixIconColor = Get.theme.scaffoldBackgroundColor;
      update();
    }
  }

  Future<File?> _captureImage() async {
    Uint8List? res = await _screenshotController.capture(
        delay: const Duration(milliseconds: 10));
    if (res != null) {
      final directory = await getApplicationDocumentsDirectory();
      final _imageName =
          DateTime.now().millisecondsSinceEpoch.toString() + "_image";
      final _imagePath =
          await File('${directory.path}/$_imageName.png').create();
      await _imagePath.writeAsBytes(res);
      return _imagePath;
    }
    return null;
  }

  void saveImage() async {
    var _captureFile = await _captureImage();
    if (_captureFile != null) {
      var result = await ImageGallerySaver.saveFile(_captureFile.path);
      if (result != null) {
        showGetSnackBar("Success", "Image Saved Success");
      }
    }
  }

  void shareImage() async {
    var _captureFile = await _captureImage();
    if (_captureFile != null) {
      await Share.shareFiles([_captureFile.path]);
    }
  }

  _storeData(String value) {
    final _timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    var _box = Hive.box('generatebox');
    if (_box.length > 9) {
      _box.deleteAt(0);
    }
    _box.put(_timeStamp, value);
  }
}
