import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/service/controllers/common_controllers/bottom_bar_controller.dart';
import 'package:qr_scanner_app/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      init: BottomBarController(),
      builder: (controller) {
        return Scaffold(
          body: controller.pages[controller.pageIndex],
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .07,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: MyColor.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () => controller.changePage(0),
                      icon: Icon(
                        Icons.history,
                        color: controller.pageIndex == 0
                            ? MyColor.black
                            : MyColor.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.changePage(1),
                      icon: Icon(
                        Icons.qr_code_scanner,
                        color: controller.pageIndex == 1
                            ? MyColor.black
                            : MyColor.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.changePage(2),
                      icon: Icon(
                        Icons.qr_code,
                        color: controller.pageIndex == 2
                            ? MyColor.black
                            : MyColor.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.changePage(3),
                      icon: Icon(
                        Icons.settings,
                        color: controller.pageIndex == 3
                            ? MyColor.black
                            : MyColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
