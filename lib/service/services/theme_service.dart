import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_scanner_app/utils/themes.dart';

class ThemeService {
  final _getStorage = GetStorage();

  ThemeData getTheme() {
    var themeKey = _getStorage.read('theme');
    ThemeData currentThemeData = MyTheme.darkPurpleTheme;
    if (themeKey != null) {
      currentThemeData = MyTheme.allThemes
          .firstWhere((element) => element.keys.first == themeKey)
          .values
          .first;
    }
    return currentThemeData;
  }

  void setTheme(ThemeData newThemeData, String key) {
    _getStorage.write('theme', key);
    Get.changeTheme(newThemeData);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: newThemeData.scaffoldBackgroundColor,
      statusBarBrightness: Brightness.dark,
    ));
  }
}
