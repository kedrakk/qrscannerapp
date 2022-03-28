import 'package:get_storage/get_storage.dart';

class SwitchService {
  final _getStorage = GetStorage();

  bool getSwitchValue() {
    var _switchKey = _getStorage.read('switchval');
    bool _switchValue = true;
    if (_switchKey != null) {
      _switchValue = _switchKey;
    }
    return _switchValue;
  }

  void setSwitchValue(bool _newValue) {
    _getStorage.write('switchval', _newValue);
  }
}
