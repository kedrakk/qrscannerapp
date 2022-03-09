import 'package:flutter/material.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:qr_scanner_app/widgets/bottomsheets.dart';
import 'package:qr_scanner_app/widgets/history_leading_icons.dart';

class QrScanResultPage extends StatelessWidget {
  const QrScanResultPage({
    Key? key,
    required this.type,
  }) : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () => showResultDetailBottomSheet(
              context, type, "This is scanned result.", "8 hours ago"),
          textColor: MyColor.white,
          leading: const ScanResultIcon(),
          title: const Text("This is scanned result."),
          subtitle: const Text("8 hours ago"),
        ),
        itemCount: 10,
      ),
    );
  }
}
