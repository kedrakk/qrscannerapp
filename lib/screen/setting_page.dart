import 'package:flutter/material.dart';
import 'package:qr_scanner_app/utils/colors.dart';

import '../widgets/bottomsheets.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SETTING"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(7),
        children: [
          const ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: Icon(Icons.language),
            title: Text("Change Language"),
          ),
          ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: const Icon(Icons.theater_comedy),
            title: const Text("Change Theme"),
            onTap: () => showThemeBottomSheet(context),
          ),
          const ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: Icon(Icons.share),
            title: Text("Share App To Your Friends"),
          ),
          const ListTile(
            iconColor: MyColor.white,
            textColor: MyColor.white,
            leading: Icon(Icons.rate_review),
            title: Text("Rate App"),
          ),
        ],
      ),
    );
  }
}
