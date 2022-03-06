import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/screen/qr_pages/generate_qr.dart';

class QRActionPage extends StatelessWidget {
  const QRActionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY QR"),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const GenerateQRPage()),
            icon: const Icon(
              Icons.photo,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text("QR Read And Generate"),
      ),
    );
  }
}
