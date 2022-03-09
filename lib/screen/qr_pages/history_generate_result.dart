import 'package:flutter/material.dart';
import 'package:qr_scanner_app/widgets/history_leading_icons.dart';

import '../../utils/colors.dart';
import '../../widgets/bottomsheets.dart';

class QRGenerateResultPage extends StatelessWidget {
  const QRGenerateResultPage({
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
              context, type, "This is generated result.", "8 hours ago"),
          textColor: MyColor.white,
          leading: const GenerateResultIcon(),
          title: const Text("This is generated result."),
          subtitle: const Text("8 hours ago"),
        ),
        itemCount: 10,
      ),
    );
  }
}
