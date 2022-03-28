import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/service/controllers/language_service.dart';
import 'package:qr_scanner_app/service/controllers/theme_service.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:qr_scanner_app/utils/languages.dart';
import 'package:qr_scanner_app/utils/themes.dart';
import 'package:qr_scanner_app/widgets/history_leading_icons.dart';
import 'package:intl/intl.dart';

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
              onPressed: () {
                ThemeService().setTheme(MyTheme.allThemes[index].values.first,
                    MyTheme.allThemes[index].keys.first);
                Get.back();
              },
              icon: CircleAvatar(
                backgroundColor: MyTheme
                    .allThemes[index].values.first.scaffoldBackgroundColor,
                child: Icon(
                  Icons.check,
                  color: Get.theme.scaffoldBackgroundColor ==
                          MyTheme.allThemes[index].values.first
                              .scaffoldBackgroundColor
                      ? MyColor.white
                      : Colors.transparent,
                ),
              ),
            ),
            itemCount: MyTheme.allThemes.length,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () => Get.back(),
              child: Text(LocaleKeys.close.tr),
            ),
          ),
        ],
      ),
    ),
  );
}

void showLanguageBottomSheet(BuildContext context) {
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
              "Please Select Your Language",
              style: MyTheme.textStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(7),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: allLanguages[index].languageIcon,
                title: Text(allLanguages[index].languageName),
                onTap: () {
                  LanguageService().setLocale(allLanguages[index].localeKey,
                      allLanguages[index].locale);
                  Get.back();
                },
                trailing: Icon(
                  Icons.check,
                  color:
                      Get.locale!.languageCode == allLanguages[index].localeKey
                          ? Get.theme.scaffoldBackgroundColor
                          : Colors.transparent,
                ),
              );
            },
            itemCount: allLanguages.length,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () => Get.back(),
              child: Text(LocaleKeys.close.tr),
            ),
          ),
        ],
      ),
    ),
  );
}

void showResultDetailBottomSheet(
    BuildContext context, String type, String title, String scanTime) {
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
              type,
              style: MyTheme.textStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: ListTile(
                leading: type.toLowerCase().contains('scan')
                    ? const ScanResultIcon()
                    : const GenerateResultIcon(),
                title: Text(title),
                subtitle: Text(
                  DateFormat('EEEE, MMMM 21, y hh:mm a').format(
                    DateTime.fromMillisecondsSinceEpoch(
                      int.parse(
                        scanTime,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () => Get.back(),
              child: Text(LocaleKeys.close.tr),
            ),
          ),
        ],
      ),
    ),
  );
}
