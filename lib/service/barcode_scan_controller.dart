import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_scanner_app/widgets/dialogs.dart';
import 'package:scan/scan.dart';

class BarcodeScanController extends GetxController {
  final ScanController _controller = ScanController();
  ScanController get scanController => _controller;
  final ImagePicker _picker = ImagePicker();

  String _qrcode = '';
  String get qrCode => _qrcode;

  scanQR(String res) {
    _qrcode = res;
    _storeData(res);
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
      scanQR(_scanRes);
    } else {
      showInvalidQRDialog();
    }
  }

  _storeData(String value) {
    final _timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    var _box = Hive.box('scanbox');
    _box.put(_timeStamp, value);
  }
}
