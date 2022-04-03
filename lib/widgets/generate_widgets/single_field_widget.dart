import 'package:flutter/material.dart';

import '../../service/controllers/qrcontrollers/qr_generate_controller.dart';
import '../../utils/colors.dart';
import '../dialogs.dart';

class SingleFieldPage extends StatelessWidget {
  const SingleFieldPage({
    Key? key,
    required this.controller,
    required this.type,
  }) : super(key: key);
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
              cursorColor: MyColor.white,
              style: const TextStyle(color: MyColor.white),
              decoration: InputDecoration(
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
            child: const Text(
              "Generate",
              style: TextStyle(color: MyColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
