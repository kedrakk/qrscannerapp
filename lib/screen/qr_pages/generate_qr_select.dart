import 'package:flutter/material.dart';
import 'package:qr_scanner_app/model/generate_type.dart';
import 'package:qr_scanner_app/utils/ads_helper.dart';
import 'package:qr_scanner_app/utils/colors.dart';

import 'show_banner_ads_page.dart';

class GenerateQRSelectPage extends StatelessWidget {
  GenerateQRSelectPage({Key? key}) : super(key: key);

  final List<GenerateType> allGenerateTypes = [
    GenerateType(
      leadingIcon: const Icon(Icons.link),
      title: "URL",
      subtitle: "Website URL Adress",
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.format_size),
      title: "TEXT",
      subtitle: "Paragraph Or Short Texts",
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.contacts),
      title: "CONTACT",
      subtitle: "Contact Information",
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.phone),
      title: "PHONE",
      subtitle: "Phone Number Information",
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.perm_phone_msg),
      title: "SMS",
      subtitle: "SMS Message To Phone",
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.alternate_email),
      title: "EMAIL",
      subtitle: "Email Address Information",
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.credit_card),
      title: "CARD",
      subtitle: "Payment Card Information",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Image"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text("Choose a frame to generate qr"),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 18 / 8,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              children: allGenerateTypes
                  .map(
                    (e) => ListTile(
                      isThreeLine: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      tileColor: MyColor.white,
                      leading: SizedBox(
                        height: double.infinity,
                        child: e.leadingIcon,
                      ),
                      title: Text(
                        e.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        e.subtitle,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 1 / 10,
        child: ShowBannerAdsPage(
          bannerAdsId: AdHelper.bannerAdUnitId,
        ),
      ),
    );
  }
}
