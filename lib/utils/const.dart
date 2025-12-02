// import 'package:barcode_scan2/model/model.dart';

const splashImage = "assets/images/qr_icon.svg";
const appPackageName = "com.myapp.qr_scanner_app";
const appversionCode = 'v 1.0.2';
const emailRegex =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

enum QRTYPE { url, text, phone, sms, email, contact }

// const scanOption = ScanOptions(
//   android: AndroidOptions(
//     aspectTolerance: 0.6,
//     useAutoFocus: true,
//   ),
// );
