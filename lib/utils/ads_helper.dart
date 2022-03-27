import 'dart:io';

import 'package:qr_scanner_app/utils/ads_const.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return bannerAndroidID;
    } else if (Platform.isIOS) {
      return bannerIOSID;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return interstitialAndroidID;
    } else if (Platform.isIOS) {
      return interstitialIOSID;
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return rewardAndroidID;
    } else if (Platform.isIOS) {
      return rewardIOSID;
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return nativeAndroidID;
    } else if (Platform.isIOS) {
      return nativeIOSID;
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
