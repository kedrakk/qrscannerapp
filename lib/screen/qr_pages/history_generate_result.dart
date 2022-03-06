import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class QRGenerateResultPage extends StatelessWidget {
  const QRGenerateResultPage({Key? key}) : super(key: key);

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
              Icons.photo,
            ),
          ),
          title: Text("This is generated result."),
          subtitle: Text("8 hours ago"),
        ),
        itemCount: 10,
      ),
    );
  }
}
