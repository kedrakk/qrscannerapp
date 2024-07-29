import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/model/history_result.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:qr_scanner_app/widgets/bottomsheets.dart';
import 'package:qr_scanner_app/widgets/history_leading_icons.dart';
import 'package:get/get.dart';

class QrScanResultPage extends StatelessWidget {
  const QrScanResultPage({
    Key? key,
    required this.type,
    required this.scanResultList,
  }) : super(key: key);
  final String type;
  final List<HistoryResult> scanResultList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: scanResultList.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  showResultDetailBottomSheet(
                    context,
                    type,
                    scanResultList[index].resultName,
                    scanResultList[index].timestamp,
                    scanResultList[index].leadingIcon,
                  );
                },
                textColor: MyColor.white,
                leading: ScanResultIcon(
                  leadingIcon: scanResultList[index].leadingIcon,
                ),
                iconColor: Get.theme.scaffoldBackgroundColor,
                title: Text(
                  scanResultList[index].resultName,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateFormat('EEEE, MMMM 21, y hh:mm a').format(
                    DateTime.fromMillisecondsSinceEpoch(
                      int.parse(
                        scanResultList[index].timestamp,
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: scanResultList.length,
            )
          : Center(
              child: Text(LocaleKeys.emptyscanresult.tr),
            ),
    );
  }
}
