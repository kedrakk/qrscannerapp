import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'screen/base/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}
