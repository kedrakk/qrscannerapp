import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService {
  final _getStorage = GetStorage();

  Locale getCurrentLanguage() {
    var _langKey = _getStorage.read('language');
    if (_langKey != null) {
      return Locale(_langKey);
    }
    return const Locale('en');
  }

  void setLocale(String key, Locale _newLocale) {
    _getStorage.write('language', key);
    Get.updateLocale(_newLocale);
  }
}
