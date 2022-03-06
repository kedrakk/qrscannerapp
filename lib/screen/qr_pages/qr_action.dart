import 'package:flutter/material.dart';

class QRActionPage extends StatelessWidget {
  const QRActionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY QR"),
        actions: [
          IconButton(
            onPressed: () {},
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
