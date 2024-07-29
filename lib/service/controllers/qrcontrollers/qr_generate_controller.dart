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
import 'package:qr_scanner_app/utils/extensions.dart';

class QRGenerator extends GetxController {
  String _qrResult = "";
  String get qrResult => _qrResult;

  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get singleFieldController => _textEditingController;

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

  void generateQRSingle(String type) {
    debugPrint(type);
    _qrResult = _textEditingController.text.toGenerateFormat(type);
    HistoryResult historyResult = HistoryResult(
      leadingIcon: "BarcodeType.${type.toLowerCase()}",
      resultName: _qrResult,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _storeData(historyResult);
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
      _qrResult = "";
      update();
    }
  }

  Future<File?> _captureImage() async {
    Uint8List? res = await _screenshotController.capture(
        delay: const Duration(milliseconds: 10));
    if (res != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imageName =
          // ignore: prefer_interpolation_to_compose_strings
          DateTime.now().millisecondsSinceEpoch.toString() + "_image";
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
    _textEditingController.dispose();
    super.onClose();
  }
}
