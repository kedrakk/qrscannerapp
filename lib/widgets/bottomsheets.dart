import 'package:flutter/material.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:qr_scanner_app/utils/themes.dart';

void showThemeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: MyColor.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              "Please Select Your Theme",
              style: MyTheme.textStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 1,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) => IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor:
                    MyTheme.allThemes[index].scaffoldBackgroundColor,
              ),
            ),
            itemCount: MyTheme.allThemes.length,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () {},
              child: const Text("CLOSE"),
            ),
          ),
        ],
      ),
    ),
  );
}
