import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_scanner_app/model/history_result.dart';
import 'screen/base/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryResultAdapter());
  runApp(const MyApp());
}
