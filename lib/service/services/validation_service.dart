import 'package:qr_scanner_app/utils/const.dart';

class ValidationService {
  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return "Please enter email address";
    } else if (!RegExp(emailRegex).hasMatch(email)) {
      return "Invalid email format! Try agin.";
    } else {
      return null;
    }
  }
}
