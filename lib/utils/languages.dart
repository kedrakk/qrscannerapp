import 'package:flutter/material.dart';

class MyLanguage {
  final String languageName;
  final Icon languageIcon;
  final Locale locale;
  final String localeKey;
  MyLanguage({
    required this.languageName,
    required this.languageIcon,
    required this.locale,
    required this.localeKey,
  });
}

final allLanguages = <MyLanguage>[
  MyLanguage(
    languageName: "English",
    languageIcon: const Icon(Icons.language),
    locale: const Locale('en', 'US'),
    localeKey: 'en',
  ),
  MyLanguage(
    languageName: "Española",
    languageIcon: const Icon(Icons.language),
    locale: const Locale('es', 'ES'),
    localeKey: 'es',
  ),
  MyLanguage(
    languageName: "မြန်မာစာ",
    languageIcon: const Icon(Icons.language),
    locale: const Locale('mm', 'MM'),
    localeKey: 'mm',
  ),
];
