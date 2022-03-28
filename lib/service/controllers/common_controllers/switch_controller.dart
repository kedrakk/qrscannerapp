import 'package:get/get.dart';

class SwitchController extends GetxController {
  bool _isSwitch = true;
  bool get isSwitch => _isSwitch;

  changeSwitchValue(bool _newVal) {
    _isSwitch = _newVal;
    update();
  }
}
