import 'package:flutter/material.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
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
