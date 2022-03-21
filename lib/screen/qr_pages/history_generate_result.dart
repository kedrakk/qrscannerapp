import 'package:flutter/material.dart';
import 'package:qr_scanner_app/model/history_result.dart';
import 'package:qr_scanner_app/widgets/history_leading_icons.dart';

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
    return Padding(
      padding: const EdgeInsets.all(7),
      child: generateResultList.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) => ListTile(
                onTap: () => showResultDetailBottomSheet(
                  context,
                  type,
                  generateResultList[index].resultName,
                  generateResultList[index].timestamp,
                ),
                textColor: MyColor.white,
                leading: const GenerateResultIcon(),
                title: Text(
                  generateResultList[index].resultName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  generateResultList[index].timestamp,
                ),
              ),
              itemCount: generateResultList.length,
            )
          : const Center(
              child: Text("Empty Generate History"),
            ),
    );
  }
}
