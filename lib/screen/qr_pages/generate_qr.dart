import 'package:flutter/material.dart';

class GenerateQRPage extends StatelessWidget {
  const GenerateQRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Generate QR",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: const Center(
        child: Text("Later"),
      ),
    );
  }
}
