import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/service/controllers/splash_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: ((controller) {
        return const Scaffold(
          body: Center(
            child: Text("Scan Or Generate QR Images via MY QR"),
          ),
        );
      }),
    );
  }
}
