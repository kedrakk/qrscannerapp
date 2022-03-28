import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_scanner_app/utils/const.dart';
import 'package:qr_scanner_app/widgets/dialogs.dart';
import 'package:scan/scan.dart';

class BarcodeScanWithBarcodeScanController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  String _qrcode = '';
  String get qrCode => _qrcode;

  scanQR() async {
    var _result = await BarcodeScanner.scan(options: scanOption);
    _qrcode = _result.rawContent;
    _storeData(_qrcode);
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
      _storeData(_qrcode);
      update();
    } else {
      showInvalidQRDialog();
    }
  }

  _storeData(String value) {
    final _timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    var _box = Hive.box('scanbox');
    if (_box.length > 9) {
      _box.deleteAt(0);
    }
    _box.put(_timeStamp, value);
  }

  @override
  void onInit() {
    scanQR();
    super.onInit();
  }
}
