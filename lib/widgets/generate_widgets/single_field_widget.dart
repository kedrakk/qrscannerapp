import 'package:flutter/material.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';

import '../../service/controllers/qrcontrollers/qr_generate_controller.dart';
import '../../utils/colors.dart';
import '../dialogs.dart';
import 'package:qr_scanner_app/utils/extensions.dart';
import 'package:get/get.dart';

class SingleFieldPage extends StatelessWidget {
  const SingleFieldPage({
    super.key,
    required this.controller,
    required this.type,
  });
  final QRGenerator controller;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextFormField(
              controller: controller.singleFieldController,
              showCursor: true,
              keyboardType: type.toInputType(),
              cursorColor: MyColor.white,
              style: const TextStyle(color: MyColor.white),
              decoration: InputDecoration(
                label: Text("Enter $type"),
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
            onPressed: () => controller.singleFieldController.text.isEmpty &&
                    controller.qrResult.isEmpty
                ? showEmptyTextDialog()
                : controller.generateQRSingle(type),
            child: Text(
              LocaleKeys.generate.tr,
              style: const TextStyle(color: MyColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
