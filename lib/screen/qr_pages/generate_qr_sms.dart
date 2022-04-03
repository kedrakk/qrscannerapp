import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/service/controllers/qrcontrollers/qr_generate_sms_controller.dart';
import 'package:qr_scanner_app/widgets/generate_widgets/smsfield.dart';
import 'package:screenshot/screenshot.dart';

import '../../utils/colors.dart';

class GenerateQRSMSPage extends StatelessWidget {
  const GenerateQRSMSPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QRSMSGenerator>(
      init: QRSMSGenerator(),
      builder: ((controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Generate SMS",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SMSFieldPage(
                  controller: controller,
                  generateType: "SMS",
                ),
                controller.qrResult.isNotEmpty
                    ? Container(
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
                          controller: controller.screenshotController,
                          child: QrImage(
                            backgroundColor: Get.theme.scaffoldBackgroundColor,
                            foregroundColor: MyColor.white,
                            data: controller.qrResult,
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
                      )
                    : Container(
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
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 10,
                ),
              ],
            ),
          ),
          bottomNavigationBar: controller.qrResult.isNotEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              side: BorderSide(color: MyColor.white),
                            ),
                          ),
                        ),
                        onPressed: () => controller.shareImage(),
                        icon: const Icon(Icons.share),
                        label: Text(LocaleKeys.sharenow.tr),
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            MyColor.white,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Get.theme.scaffoldBackgroundColor,
                          ),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              side: BorderSide(color: MyColor.white),
                            ),
                          ),
                        ),
                        onPressed: () => controller.saveImage(),
                        icon: const Icon(Icons.check),
                        label: Text(LocaleKeys.savenow.tr),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        );
      }),
    );
  }
}
