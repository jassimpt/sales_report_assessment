import 'package:assessment/model/day_closing_report_model.dart';
import 'package:assessment/model/sales_report_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataController extends ChangeNotifier {
  List<SalesReportModel> salesReportList = [];
  List<DayClosingReportModel> dayClosingReportList = [];

  void addSalesReport(SalesReportModel salesReport) async {
    final salesReportBox = await Hive.openBox<SalesReportModel>("salesReports");
    salesReportList.add(salesReport);
    salesReportBox.add(salesReport);
    notifyListeners();
  }

  void fetchSalesReport() async {
    final salesReportBox = await Hive.openBox<SalesReportModel>("salesReports");
    salesReportList.clear();
    salesReportList = salesReportBox.values.toList();
    notifyListeners();
  }

  void addDayClosing(DayClosingReportModel dayClosing) async {
    final dayClosingBox =
        await Hive.openBox<DayClosingReportModel>("dayClosings");
    dayClosingReportList.add(dayClosing);
    dayClosingBox.add(dayClosing);
    notifyListeners();
  }

  void fetchDayClosing() async {
    final dayClosingBox =
        await Hive.openBox<DayClosingReportModel>("dayClosings");
    dayClosingReportList.clear();
    dayClosingReportList = dayClosingBox.values.toList();
    notifyListeners();
  }

  List<SalesReportModel> getSalesReportsByDate(String date) {
    return salesReportList.where((report) => report.date == date).toList();
  }
}
