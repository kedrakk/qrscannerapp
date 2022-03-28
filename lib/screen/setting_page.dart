import 'package:flutter/material.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/service/controllers/switch_controller.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:get/get.dart';
import '../widgets/bottomsheets.dart';
import 'qr_pages/show_banner_ads_page.dart';

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
            leading: const Icon(Icons.language),
            title: Text(LocaleKeys.changelanugage.tr),
            onTap: () => showLanguageBottomSheet(context),
          ),
          const AutoScanWidget(),
          ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: const Icon(Icons.theater_comedy),
            title: Text(LocaleKeys.changetheme.tr),
            onTap: () => showThemeBottomSheet(context),
          ),
          ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: const Icon(Icons.share),
            title: Text(LocaleKeys.shareapp.tr),
          ),
          ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: const Icon(Icons.rate_review),
            title: Text(LocaleKeys.shareapp.tr),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 1 / 10,
        child: const ShowBannerAdsPage(),
      ),
    );
  }
}

class AutoScanWidget extends StatelessWidget {
  const AutoScanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwitchController>(
      init: SwitchController(),
      builder: ((controller) {
        return ListTile(
          iconColor: MyColor.white,
          textColor: MyColor.white,
          leading: const Icon(Icons.qr_code_2),
          trailing: Switch(
            activeColor: MyColor.red,
            value: controller.isSwitch,
            onChanged: (value) => controller.changeSwitchValue(value),
          ),
          title: const Text("Auto Scan On Page Start"),
          onTap: () => controller.changeSwitchValue(!controller.isSwitch),
        );
      }),
    );
  }
}
