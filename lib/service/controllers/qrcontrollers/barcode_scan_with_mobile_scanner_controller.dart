import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_scanner_app/model/history_result.dart';
import 'package:scan/scan.dart';
import '../../../widgets/dialogs.dart';

class BarcodeScanWithMobileScannerController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  String _qrcode = '';
  String get qrCode => _qrcode;

  String _codeType = '';
  String get codeType => _codeType;

  scanQR(String res, String type) {
    _qrcode = res;
    _codeType = type;
    HistoryResult historyResult = HistoryResult(
        leadingIcon: _codeType,
        resultName: _qrcode,
        timestamp: DateTime.now().millisecondsSinceEpoch.toString());
    _storeData(historyResult);
    update();
  }

  refreshNew() {
    _qrcode = '';
    update();
  }

  pickQRImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      scanFromImage(pickedImage.path);
    }
  }

  scanFromImage(String path) async {
    String? scanRes = await Scan.parse(path);
    if (scanRes != null) {
      scanQR(scanRes, "QR TYPE");
    } else {
      showInvalidQRDialog();
    }
  }

  _storeData(HistoryResult historyResult) {
    var box = Hive.box('scanbox');
    if (box.length > 9) {
      box.deleteAt(0);
    }
    box.put(historyResult.timestamp, historyResult);
  }
}
