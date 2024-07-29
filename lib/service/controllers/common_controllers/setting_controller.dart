import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/const.dart';

class SettingController extends GetxController {
  shareApp() {
    Share.share(
        ("https://play.google.com/store/apps/details?id=$appPackageName"),
        subject: "QR Scanner App");
  }

  launchAndRate() async {
    try {
      launchUrl(Uri.parse("market://details?id=$appPackageName"));
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      launchUrl(Uri.parse(
          "https://play.google.com/store/apps/details?id=$appPackageName"));
    } finally {
      launchUrl(Uri.parse(
          "https://play.google.com/store/apps/details?id=$appPackageName"));
    }
  }
}
