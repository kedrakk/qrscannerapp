import 'package:flutter/material.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/service/controllers/common_controllers/setting_controller.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:get/get.dart';
import '../widgets/bottomsheets.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.setting.tr),
      ),
      body: ListView(
        padding: const EdgeInsets.all(7),
        children: [
          ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: const Icon(Icons.translate),
            title: Text(LocaleKeys.changelanugage.tr),
            onTap: () => showLanguageBottomSheet(context),
          ),
          ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: const Icon(Icons.palette),
            title: Text(LocaleKeys.changetheme.tr),
            onTap: () => showThemeBottomSheet(context),
          ),
          ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: const Icon(Icons.share),
            title: Text(LocaleKeys.shareapp.tr),
            onTap: () => Get.find<SettingController>().shareApp(),
          ),
          ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: const Icon(Icons.rate_review),
            title: Text(LocaleKeys.rateapp.tr),
            onTap: () => Get.find<SettingController>().launchAndRate(),
          ),
        ],
      ),
      // bottomNavigationBar: SizedBox(
      //   height: MediaQuery.of(context).size.height * 1 / 10,
      //   child: const ShowBannerAdsPage(),
      // ),
    );
  }
}
