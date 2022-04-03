// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryResultAdapter extends TypeAdapter<HistoryResult> {
  @override
  final int typeId = 0;

  @override
  HistoryResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryResult(
      timestamp: fields[0] as String,
      resultName: fields[1] as String,
      leadingIcon: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryResult obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.resultName)
      ..writeByte(2)
      ..write(obj.leadingIcon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
