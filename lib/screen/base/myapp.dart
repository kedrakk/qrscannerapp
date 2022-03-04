import 'package:flutter/material.dart';
import 'package:qr_scanner_app/utils/themes.dart';
import '../home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightBlueTheme,
      home: const HomePage(),
    );
  }
}
