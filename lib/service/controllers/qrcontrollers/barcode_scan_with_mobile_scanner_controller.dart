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
    HistoryResult _historyResult = HistoryResult(
        leadingIcon: _codeType,
        resultName: _qrcode,
        timestamp: DateTime.now().millisecondsSinceEpoch.toString());
    _storeData(_historyResult);
    update();
  }

  refreshNew() {
    _qrcode = '';
    update();
  }

  pickQRImage() async {
    final XFile? _pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedImage != null) {
      scanFromImage(_pickedImage.path);
    }
  }

  scanFromImage(String path) async {
    String? _scanRes = await Scan.parse(path);
    if (_scanRes != null) {
      scanQR(_scanRes, "QR TYPE");
    } else {
      showInvalidQRDialog();
    }
  }

  _storeData(HistoryResult _historyResult) {
    var _box = Hive.box('scanbox');
    if (_box.length > 9) {
      _box.deleteAt(0);
    }
    _box.put(_historyResult.timestamp, _historyResult);
  }
}
