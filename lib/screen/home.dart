import 'package:flutter/material.dart';
import 'package:qr_scanner_app/widgets/bottomsheets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () => showThemeBottomSheet(context),
            icon: const Icon(
              Icons.ac_unit,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
