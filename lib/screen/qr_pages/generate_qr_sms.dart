import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/service/controllers/qrcontrollers/qr_generate_sms_controller.dart';
import 'package:qr_scanner_app/widgets/generate_widgets/share_buttons.dart';
import 'package:qr_scanner_app/widgets/generate_widgets/smsfield.dart';
import '../../widgets/generate_widgets/generate_result_widget.dart';

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
                    ? GenerateResultWidget(
                        screenshotController: controller.screenshotController,
                        resultToShow: controller.qrResult,
                      )
                    : const EmptyWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 10,
                ),
              ],
            ),
          ),
          bottomNavigationBar: controller.qrResult.isNotEmpty
              ? SharedButtonsWidget(
                  onPressedShare: () => controller.shareImage(),
                  onPressedSave: () => controller.saveImage(),
                )
              : const SizedBox.shrink(),
        );
      }),
    );
  }
}
