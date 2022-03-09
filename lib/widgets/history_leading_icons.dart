import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ScanResultIcon extends StatelessWidget {
  const ScanResultIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 25,
      backgroundColor: MyColor.white,
      child: Icon(
        Icons.qr_code,
      ),
    );
  }
}

class GenerateResultIcon extends StatelessWidget {
  const GenerateResultIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 25,
      backgroundColor: MyColor.white,
      child: Icon(
        Icons.photo,
      ),
    );
  }
}
