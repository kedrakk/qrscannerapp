import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/service/controllers/qrcontrollers/qr_generate_controller.dart';
import 'package:qr_scanner_app/widgets/generate_widgets/generate_result_widget.dart';
import 'package:qr_scanner_app/widgets/generate_widgets/single_field_widget.dart';
import '../../widgets/generate_widgets/share_buttons.dart';

class GenerateQRPage extends StatelessWidget {
  const GenerateQRPage({
    super.key,
    required this.generateType,
  });
  final String generateType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Generate $generateType",
          style: const TextStyle(
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
                SingleFieldPage(
                  controller: controller,
                  type: generateType,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 10,
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
                controller.qrResult.isNotEmpty
                    ? SharedButtonsWidget(
                        onPressedShare: () => controller.shareImage(),
                        onPressedSave: () => controller.saveImage(),
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
