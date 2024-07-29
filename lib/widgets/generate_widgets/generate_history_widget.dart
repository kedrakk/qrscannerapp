import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'qrimage_view_widget.dart';

class GenerateHistoryResultWidget extends StatelessWidget {
  const GenerateHistoryResultWidget({
    super.key,
    required this.resultToShow,
  });
  final String resultToShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      height: MediaQuery.of(context).size.width * 1.7 / 2,
      decoration: const BoxDecoration(
        color: MyColor.white,
      ),
      child: QrImageViewWidget(
        resultToShow: resultToShow,
      ),
    );
  }
}
