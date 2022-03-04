import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_scanner_app/utils/themes.dart';

class ThemeService {
  final _getStorage = GetStorage();

  ThemeData getTheme() {
    var _themeKey = _getStorage.read('theme');
    ThemeData _currentThemeData = MyTheme.darkPurpleTheme;
    if (_themeKey != null) {
      _currentThemeData = MyTheme.allThemes
          .firstWhere((element) => element.keys.first == _themeKey)
          .values
          .first;
    }
    return _currentThemeData;
  }

  void setTheme(ThemeData _newThemeData, String key) {
    _getStorage.write('theme', key);
    Get.changeTheme(_newThemeData);
  }
}
