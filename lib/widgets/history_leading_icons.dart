import 'package:flutter/material.dart';
import 'package:qr_scanner_app/utils/extensions.dart';
import '../utils/colors.dart';

class ScanResultIcon extends StatelessWidget {
  const ScanResultIcon({
    super.key,
    required this.leadingIcon,
  });
  final String leadingIcon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: MyColor.white,
      child: leadingIcon.typeIcon(),
    );
  }
}

class GenerateResultIcon extends StatelessWidget {
  const GenerateResultIcon({
    super.key,
    required this.leadingIcon,
  });
  final String leadingIcon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: MyColor.white,
      child: leadingIcon.typeIcon(),
    );
  }
}
