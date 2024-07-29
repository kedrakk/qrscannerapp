import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/locales.g.dart';
import '../../utils/colors.dart';

class SharedButtonsWidget extends StatelessWidget {
  const SharedButtonsWidget({
    Key? key,
    required this.onPressedShare,
    required this.onPressedSave,
  }) : super(key: key);
  final void Function()? onPressedShare;
  final void Function()? onPressedSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(
                  side: BorderSide(color: MyColor.white),
                ),
              ),
            ),
            onPressed: onPressedShare,
            icon: const Icon(Icons.share),
            label: Text(LocaleKeys.sharenow.tr),
          ),
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                MyColor.white,
              ),
              foregroundColor: WidgetStateProperty.all(
                Get.theme.scaffoldBackgroundColor,
              ),
              shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(
                  side: BorderSide(color: MyColor.white),
                ),
              ),
            ),
            onPressed: onPressedSave,
            icon: const Icon(Icons.check),
            label: Text(LocaleKeys.savenow.tr),
          ),
        ],
      ),
    );
  }
}
