// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_closing_report_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayClosingReportModelAdapter extends TypeAdapter<DayClosingReportModel> {
  @override
  final int typeId = 2;

  @override
  DayClosingReportModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayClosingReportModel(
      advance: fields[6] as double?,
      date: fields[0] as String?,
      employeeId: fields[2] as String?,
      employeeName: fields[1] as String?,
      netCollection: fields[7] as double?,
      status: fields[8] as String?,
      totalCollection: fields[5] as double?,
      totalSales: fields[4] as double?,
      totalServices: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, DayClosingReportModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.employeeName)
      ..writeByte(2)
      ..write(obj.employeeId)
      ..writeByte(3)
      ..write(obj.totalServices)
      ..writeByte(4)
      ..write(obj.totalSales)
      ..writeByte(5)
      ..write(obj.totalCollection)
      ..writeByte(6)
      ..write(obj.advance)
      ..writeByte(7)
      ..write(obj.netCollection)
      ..writeByte(8)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayClosingReportModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
