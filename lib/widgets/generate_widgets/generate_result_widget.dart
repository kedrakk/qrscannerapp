import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/widgets/generate_widgets/qrimage_view_widget.dart';
import 'package:screenshot/screenshot.dart';
import '../../generated/locales.g.dart';
import '../../utils/colors.dart';

class GenerateResultWidget extends StatelessWidget {
  const GenerateResultWidget({
    super.key,
    required this.screenshotController,
    required this.resultToShow,
  });
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
        child: QrImageViewWidget(
          resultToShow: resultToShow,
        ),
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

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
