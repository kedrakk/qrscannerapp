import 'package:flutter/material.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';

import '../../service/controllers/qrcontrollers/qr_generate_sms_controller.dart';
import '../../utils/colors.dart';
import '../dialogs.dart';
import 'package:get/get.dart';

class SMSFieldPage extends StatelessWidget {
  const SMSFieldPage({
    super.key,
    required this.controller,
    required this.generateType,
  });
  final QRSMSGenerator controller;
  final String generateType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 5, right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: controller.phoneContoller,
            keyboardType: TextInputType.number,
            showCursor: true,
            textInputAction: TextInputAction.next,
            cursorColor: MyColor.white,
            style: const TextStyle(color: MyColor.white),
            decoration: InputDecoration(
              label: const Text("Enter Phone Number"),
              labelStyle: const TextStyle(color: MyColor.white, fontSize: 13),
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
                onPressed: () => controller.clearKeywords("phone"),
                icon: Icon(
                  Icons.close,
                  color: controller.phoneSuffixIconColor,
                ),
              ),
              suffixIconColor: controller.phoneSuffixIconColor,
            ),
            onChanged: (txt) => controller.textOnchange(txt, "phone"),
            onFieldSubmitted: (txt) {
              FocusScope.of(context).requestFocus(controller.smsFoucs);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
          ),
          TextFormField(
            focusNode: controller.smsFoucs,
            controller: controller.smsController,
            showCursor: true,
            cursorColor: MyColor.white,
            style: const TextStyle(color: MyColor.white),
            decoration: InputDecoration(
              label: const Text("Enter SMS"),
              labelStyle: const TextStyle(color: MyColor.white, fontSize: 13),
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
                onPressed: () => controller.clearKeywords("sms"),
                icon: Icon(Icons.close, color: controller.smsSuffixIconColor),
              ),
              suffixIconColor: controller.smsSuffixIconColor,
            ),
            onChanged: (txt) => controller.textOnchange(txt, "sms"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: TextButton(
              onPressed: () => controller.phoneContoller.text.isEmpty &&
                      controller.smsController.text.isEmpty &&
                      controller.qrResult.isEmpty
                  ? showEmptyTextDialog()
                  : controller.generateQRSingle(generateType),
              child: Text(
                LocaleKeys.clickheretogenerateqr.tr,
                style: const TextStyle(color: MyColor.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
