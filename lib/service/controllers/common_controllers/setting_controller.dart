import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/const.dart';

class SettingController extends GetxController {
  shareApp() {
    Share.share(
        ("https://play.google.com/store/apps/details?id=" + appPackageName),
        subject: "QR Scanner App");
  }

  launchAndRate() async {
    try {
      launch("market://details?id=" + appPackageName);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      launch("https://play.google.com/store/apps/details?id=" + appPackageName);
    } finally {
      launch("https://play.google.com/store/apps/details?id=" + appPackageName);
    }
  }
}
