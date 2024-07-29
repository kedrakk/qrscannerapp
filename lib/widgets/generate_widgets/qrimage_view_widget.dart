import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_app/utils/colors.dart';

import '../../generated/locales.g.dart';

class QrImageViewWidget extends StatelessWidget {
  const QrImageViewWidget({
    Key? key,
    required this.resultToShow,
  }) : super(key: key);
  final String resultToShow;

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      eyeStyle: const QrEyeStyle(
        color: MyColor.white,
        eyeShape: QrEyeShape.square,
      ),
      dataModuleStyle: const QrDataModuleStyle(
        color: MyColor.white,
        dataModuleShape: QrDataModuleShape.square,
      ),
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
    );
  }
}
