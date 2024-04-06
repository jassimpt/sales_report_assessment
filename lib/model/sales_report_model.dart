import 'package:hive_flutter/hive_flutter.dart';
part 'sales_report_model.g.dart';

@HiveType(typeId: 1)
class SalesReportModel {
  @HiveField(0)
  String? date;
  @HiveField(1)
  String? employeeName;
  @HiveField(2)
  String? employeeId;
  @HiveField(3)
  double? productTotal;
  @HiveField(4)
  double? serviceTotal;
  @HiveField(5)
  double? subTotal;
  @HiveField(6)
  double? discount;
  @HiveField(7)
  double? totalAmount;
  @HiveField(8)
  String? paymentMethod;

  SalesReportModel({
    required this.date,
    required this.discount,
    required this.employeeId,
    required this.employeeName,
    required this.paymentMethod,
    required this.productTotal,
    required this.serviceTotal,
    required this.subTotal,
    required this.totalAmount,
  });
}
