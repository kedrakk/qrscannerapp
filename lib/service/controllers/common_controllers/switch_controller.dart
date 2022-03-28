import 'package:get/get.dart';
import 'package:qr_scanner_app/service/services/switch_service.dart';

class SwitchController extends GetxController {
  bool _isSwitch = SwitchService().getSwitchValue();
  bool get isSwitch => _isSwitch;

  changeSwitchValue(bool _newVal) {
    _isSwitch = _newVal;
    SwitchService().setSwitchValue(_isSwitch);
    update();
  }
}
