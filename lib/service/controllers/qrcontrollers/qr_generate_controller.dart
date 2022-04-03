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
    HistoryResult _historyResult = HistoryResult(
      leadingIcon: "BarcodeType.${type.toLowerCase()}",
      resultName: _qrResult,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _storeData(_historyResult);
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
        showGetSnackBar(LocaleKeys.success.tr, LocaleKeys.imagesavesuccess.tr);
      }
    }
  }

  void shareImage() async {
    var _captureFile = await _captureImage();
    if (_captureFile != null) {
      await Share.shareFiles([_captureFile.path]);
    }
  }

  _storeData(HistoryResult _historyResult) {
    var _box = Hive.box('generatebox');
    if (_box.length > 9) {
      _box.deleteAt(0);
    }
    _box.put(_historyResult.timestamp, _historyResult);
  }

  @override
  void onClose() {
    _textEditingController.dispose();
    super.onClose();
  }
}
