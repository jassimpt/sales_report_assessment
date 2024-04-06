import 'package:hive_flutter/hive_flutter.dart';
part 'day_closing_report_model.g.dart';

@HiveType(typeId: 2)
class DayClosingReportModel {
  @HiveField(0)
  String? date;
  @HiveField(1)
  String? employeeName;
  @HiveField(2)
  String? employeeId;
  @HiveField(3)
  double? totalServices;
  @HiveField(4)
  double? totalSales;
  @HiveField(5)
  double? totalCollection;
  @HiveField(6)
  double? advance;
  @HiveField(7)
  double? netCollection;
  @HiveField(8)
  String? status;

  DayClosingReportModel({
    required this.advance,
    required this.date,
    required this.employeeId,
    required this.employeeName,
    required this.netCollection,
    required this.status,
    required this.totalCollection,
    required this.totalSales,
    required this.totalServices,
  });
}
