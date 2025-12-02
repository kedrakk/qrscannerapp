import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/service/services/validation_service.dart';
import 'package:qr_scanner_app/utils/const.dart';

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
  final QRTYPE type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Form(
        key: controller.formKey,
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
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  label: Text("Enter ${type.name}"),
                  labelStyle:
                      const TextStyle(color: MyColor.white, fontSize: 13),
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
                  prefix: type == QRTYPE.phone
                      ? CountryCodePicker(
                          padding: const EdgeInsets.all(0),
                          dialogTextStyle:
                              const TextStyle(color: MyColor.black),
                          searchStyle: const TextStyle(color: MyColor.black),
                          onChanged: (newCode) {
                            controller.updateCountry(newCode.dialCode ?? "");
                          },
                          initialSelection: 'MM',
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        )
                      : const SizedBox(),
                ),
                maxLines: 4,
                minLines: 2,
                onChanged: (txt) => controller.textOnchange(txt),
                validator: (input) {
                  if (type == QRTYPE.email) {
                    return ValidationService.emailValidation(input);
                  } else {
                    return null;
                  }
                },
              ),
            ),
            TextButton(
              onPressed: () {
                controller.singleFieldController.text.isEmpty &&
                        controller.qrResult.isEmpty
                    ? showEmptyTextDialog()
                    : controller.generateQRSingle(type);
              },
              child: Text(
                LocaleKeys.generate.tr,
                style: const TextStyle(color: MyColor.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
