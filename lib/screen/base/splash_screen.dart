import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/service/controllers/splash_controller.dart';
import 'package:qr_scanner_app/utils/const.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: ((controller) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 4,
                child: SvgPicture.asset(splashImage),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Scan Or Generate QR Images via ",
                    ),
                    TextSpan(
                      text: "MY QR",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
