// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalesReportModelAdapter extends TypeAdapter<SalesReportModel> {
  @override
  final int typeId = 1;

  @override
  SalesReportModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalesReportModel(
      date: fields[0] as String?,
      discount: fields[6] as double?,
      employeeId: fields[2] as String?,
      employeeName: fields[1] as String?,
      paymentMethod: fields[8] as String?,
      productTotal: fields[3] as double?,
      serviceTotal: fields[4] as double?,
      subTotal: fields[5] as double?,
      totalAmount: fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, SalesReportModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.employeeName)
      ..writeByte(2)
      ..write(obj.employeeId)
      ..writeByte(3)
      ..write(obj.productTotal)
      ..writeByte(4)
      ..write(obj.serviceTotal)
      ..writeByte(5)
      ..write(obj.subTotal)
      ..writeByte(6)
      ..write(obj.discount)
      ..writeByte(7)
      ..write(obj.totalAmount)
      ..writeByte(8)
      ..write(obj.paymentMethod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesReportModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
