import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_scanner_app/model/history_result.dart';

class HistoryController extends GetxController {
  List<HistoryResult> _scanResultList = [];
  List<HistoryResult> _generateResult = [];
  List<HistoryResult> get scanResult => _scanResultList;
  List<HistoryResult> get generateResult => _generateResult;

  @override
  void onInit() {
    getScanResult();
    getGenerateResult();
    super.onInit();
  }

  void getScanResult() {
    _scanResultList.clear();
    var _box = Hive.box('scanbox');
    for (var item in _box.keys) {
      _scanResultList.add(HistoryResult(
        timestamp: item,
        resultName: _box.get(item),
      ));
    }
    _scanResultList = _scanResultList.reversed.toList();
    update();
  }

  void getGenerateResult() {
    _generateResult.clear();
    var _box = Hive.box('generatebox');
    for (var item in _box.keys) {
      _generateResult.add(HistoryResult(
        timestamp: item,
        resultName: _box.get(item),
      ));
    }
    _generateResult = _generateResult.reversed.toList();
    update();
  }
}
