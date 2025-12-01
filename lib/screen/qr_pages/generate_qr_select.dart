import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/generated/locales.g.dart';
import 'package:qr_scanner_app/model/generate_type.dart';
import 'package:qr_scanner_app/screen/qr_pages/generate_qr.dart';
import 'package:qr_scanner_app/screen/qr_pages/generate_qr_sms.dart';
import 'package:qr_scanner_app/utils/colors.dart';
import 'package:qr_scanner_app/utils/const.dart';
import 'package:qr_scanner_app/widgets/dialogs.dart';

class GenerateQRSelectPage extends StatelessWidget {
  GenerateQRSelectPage({super.key});

  final List<GenerateType> allGenerateTypes = [
    GenerateType(
      leadingIcon: const Icon(Icons.link),
      title: QRTYPE.url,
      subtitle: LocaleKeys.urldesc.tr,
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.format_size),
      title: QRTYPE.text,
      subtitle: LocaleKeys.textdesc.tr,
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.phone),
      title: QRTYPE.phone,
      subtitle: LocaleKeys.phonedesc.tr,
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.perm_phone_msg),
      title: QRTYPE.sms,
      subtitle: LocaleKeys.smsdesc.tr,
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.alternate_email),
      title: QRTYPE.email,
      subtitle: LocaleKeys.emaildesc.tr,
    ),
    GenerateType(
      leadingIcon: const Icon(Icons.contacts),
      title: QRTYPE.contact,
      subtitle: LocaleKeys.contactdesc.tr,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.generateqr.tr),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(LocaleKeys.chooseaframe.tr),
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
                      onTap: () {
                        if (e.title == QRTYPE.sms) {
                          Get.to(
                            () => const GenerateQRSMSPage(),
                          );
                        } else if (e.title == QRTYPE.contact) {
                          showComingSoonDialog();
                        } else {
                          Get.to(
                            () => GenerateQRPage(
                              generateType: e.title,
                            ),
                          );
                        }
                      },
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
                      iconColor: Get.theme.scaffoldBackgroundColor,
                      title: Text(
                        e.title.name.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        e.subtitle,
                        style:
                            const TextStyle(fontSize: 12, color: MyColor.grey),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
