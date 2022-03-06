import 'package:flutter/material.dart';
import 'package:qr_scanner_app/utils/colors.dart';

class QrScanResultPage extends StatelessWidget {
  const QrScanResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: ListView.builder(
        itemBuilder: (context, index) => const ListTile(
          textColor: MyColor.white,
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: MyColor.white,
            child: Icon(
              Icons.qr_code,
            ),
          ),
          title: Text("This is scanned result."),
          subtitle: Text("8 hours ago"),
        ),
        itemCount: 10,
      ),
    );
  }
}
