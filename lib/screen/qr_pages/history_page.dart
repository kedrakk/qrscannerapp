import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/screen/qr_pages/history_generate_result.dart';
import 'package:qr_scanner_app/screen/qr_pages/history_scan_result.dart';
import 'package:qr_scanner_app/service/controllers/qrcontrollers/history_controller.dart';
import 'package:qr_scanner_app/utils/colors.dart';

class QRHistoryPage extends StatelessWidget {
  const QRHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      builder: (controller) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: MyColor.white,
            title: TabBar(
              labelColor: MyColor.black,
              indicatorColor: Get.theme.scaffoldBackgroundColor,
              tabs: [
                Tab(
                  text: LocaleKeys.qrscanresult.tr,
                ),
                Tab(
                  text: LocaleKeys.qrgenerateersult.tr,
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              QrScanResultPage(
                type: LocaleKeys.qrscanresult.tr,
                scanResultList: controller.scanResult,
              ),
              QRGenerateResultPage(
                type: LocaleKeys.qrgenerateersult.tr,
                generateResultList: controller.generateResult,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
