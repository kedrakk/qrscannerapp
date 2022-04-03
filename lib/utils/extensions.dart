import 'package:flutter/material.dart';

extension ToBarcodeType on String {
  String barcodeType() {
    return startsWith("BarcodeType")
        ? substring(12).toUpperCase() + " TYPE"
        : this;
  }
}

extension TypeIcon on String {
  Icon typeIcon() {
    switch (this) {
      case "BarcodeType.contactInfo":
        return const Icon(Icons.contacts);
      case "BarcodeType.email":
        return const Icon(Icons.alternate_email);
      case "BarcodeType.phone":
        return const Icon(Icons.phone);
      case "BarcodeType.sms":
        return const Icon(Icons.sms);
      case "BarcodeType.text":
        return const Icon(Icons.format_size);
      case "BarcodeType.url":
        return const Icon(Icons.link);
      case "BarcodeType.wifi":
        return const Icon(Icons.wifi);
      default:
        return const Icon(Icons.qr_code_2);
    }
  }
}
