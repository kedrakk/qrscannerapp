import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../generated/locales.g.dart';
import '../../utils/colors.dart';

class GenerateHistoryResultWidget extends StatelessWidget {
  const GenerateHistoryResultWidget({
    Key? key,
    required this.resultToShow,
  }) : super(key: key);
  final String resultToShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      height: MediaQuery.of(context).size.width * 1.7 / 2,
      decoration: const BoxDecoration(
        color: MyColor.white,
      ),
      child: QrImage(
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
    );
  }
}
