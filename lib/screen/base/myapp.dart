import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/service/box_controller.dart';
import 'package:qr_scanner_app/service/language_service.dart';
import 'package:qr_scanner_app/service/theme_service.dart';
import '../home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ThemeService().getTheme().scaffoldBackgroundColor,
      statusBarBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      title: 'QR Scanner',
      theme: ThemeService().getTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      locale: LanguageService().getCurrentLanguage(),
      translationsKeys: AppTranslation.translations,
      fallbackLocale: const Locale('en', 'US'),
      initialBinding: BindingsBuilder.put(
        () => BoxController(),
      ),
    );
  }
}
