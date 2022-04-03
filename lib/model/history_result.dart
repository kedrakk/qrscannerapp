import 'package:hive/hive.dart';
part 'history_result.g.dart';

@HiveType(typeId: 0)
class HistoryResult {
  @HiveField(0)
  final String timestamp;

  @HiveField(1)
  final String resultName;

  @HiveField(2)
  final String leadingIcon;
  HistoryResult({
    required this.timestamp,
    required this.resultName,
    required this.leadingIcon,
  });
}
