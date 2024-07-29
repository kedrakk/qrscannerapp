import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/model/history_result.dart';
import 'package:qr_scanner_app/widgets/history_leading_icons.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../widgets/bottomsheets.dart';

class QRGenerateResultPage extends StatelessWidget {
  const QRGenerateResultPage({
    Key? key,
    required this.type,
    required this.generateResultList,
  }) : super(key: key);
  final String type;
  final List<HistoryResult> generateResultList;

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<InterstitialAdsController>(
    //   init: InterstitialAdsController(),
    //   builder: ((controller) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: generateResultList.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  // if (controller.isInterstitialAdReady &&
                  //     controller.interstitialAds != null) {
                  //   controller.interstitialAds?.show();
                  // }
                  showResultDetailBottomSheet(
                    context,
                    type,
                    generateResultList[index].resultName,
                    generateResultList[index].timestamp,
                    generateResultList[index].leadingIcon,
                  );
                },
                textColor: MyColor.white,
                leading: GenerateResultIcon(
                  leadingIcon: generateResultList[index].leadingIcon,
                ),
                iconColor: Get.theme.scaffoldBackgroundColor,
                title: Text(
                  generateResultList[index].resultName,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateFormat('EEEE, MMMM 21, y hh:mm a').format(
                    DateTime.fromMillisecondsSinceEpoch(
                      int.parse(
                        generateResultList[index].timestamp,
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: generateResultList.length,
            )
          : Center(
              child: Text(LocaleKeys.emptygenerateresult.tr),
            ),
    );
    //   }),
    // );
  }
}
