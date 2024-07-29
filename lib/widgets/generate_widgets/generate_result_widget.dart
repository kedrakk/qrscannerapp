import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import '../../generated/locales.g.dart';
import '../../utils/colors.dart';

class GenerateResultWidget extends StatelessWidget {
  const GenerateResultWidget({
    Key? key,
    required this.screenshotController,
    required this.resultToShow,
  }) : super(key: key);
  final ScreenshotController screenshotController;
  final String resultToShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      width: MediaQuery.of(context).size.width * 1.7 / 2,
      height: MediaQuery.of(context).size.width * 1.7 / 2,
      decoration: const BoxDecoration(
        color: MyColor.white,
      ),
      child: Screenshot(
        controller: screenshotController,
        child: QrImageView(
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          foregroundColor: MyColor.white,
          data: resultToShow,
          version: QrVersions.auto,
          errorStateBuilder: (cxt, err) {
            return Center(
              child: Text(
                LocaleKeys.somethingwentwrong.tr,
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      width: MediaQuery.of(context).size.width * 1.7 / 2,
      height: MediaQuery.of(context).size.width * 1.7 / 2,
      decoration: const BoxDecoration(
        color: MyColor.grey,
      ),
      child: Center(
        child: Text(
          LocaleKeys.pleaseenterthetext.tr,
        ),
      ),
    );
  }
}
