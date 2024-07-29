import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService {
  final _getStorage = GetStorage();

  Locale getCurrentLanguage() {
    var langKey = _getStorage.read('language');
    if (langKey != null) {
      return Locale(langKey);
    }
    return const Locale('en');
  }

  void setLocale(String key, Locale newLocale) {
    _getStorage.write('language', key);
    Get.updateLocale(newLocale);
  }
}
