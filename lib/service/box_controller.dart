import 'package:get/get.dart';
import 'package:hive/hive.dart';

class BoxController extends GetxController {
  late Box<dynamic> _scanBox;
  late Box<dynamic> _generateBox;

  Box<dynamic> get scanBox => _scanBox;
  Box<dynamic> get generateBox => _generateBox;

  @override
  void onInit() {
    _openBoxes();
    super.onInit();
  }

  _openBoxes() async {
    _scanBox = await Hive.openBox("scanbox");
    _generateBox = await Hive.openBox("generatebox");
  }
}
