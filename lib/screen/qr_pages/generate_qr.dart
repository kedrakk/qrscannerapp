import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/service/qr_generate_controller.dart';
import 'package:qr_scanner_app/widgets/dialogs.dart';
import 'package:screenshot/screenshot.dart';

import '../../utils/colors.dart';

class GenerateQRPage extends StatelessWidget {
  const GenerateQRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Generate QR",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: GetBuilder<QRGenerator>(
        init: QRGenerator(),
        builder: ((controller) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: controller.qrTextController,
                          showCursor: true,
                          cursorColor: MyColor.white,
                          style: const TextStyle(color: MyColor.white),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColor.white,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColor.white,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => controller.clearKeywords(),
                              icon: Icon(
                                Icons.close,
                                color: controller.suffixIconColor,
                              ),
                            ),
                            suffixIconColor: controller.suffixIconColor,
                          ),
                          maxLines: 4,
                          minLines: 2,
                          onChanged: (txt) => controller.textOnchange(txt),
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            controller.qrTextController.text.isEmpty
                                ? showEmptyTextDialog()
                                : controller.generateQR(),
                        child: const Text(
                          "Generate",
                          style: TextStyle(color: MyColor.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 10,
                ),
                controller.qrTextController.text.isNotEmpty &&
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
                controller.qrTextController.text.isNotEmpty &&
                        controller.qrResult.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
