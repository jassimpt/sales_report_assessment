import 'package:assessment/controllers/data_controller.dart';
import 'package:assessment/model/day_closing_report_model.dart';
import 'package:assessment/model/sales_report_model.dart';
import 'package:assessment/views/widgets/custom_app_bar.dart';
import 'package:assessment/views/widgets/custom_submit_button.dart';
import 'package:assessment/views/widgets/day_closing_data_head.dart';
import 'package:assessment/views/widgets/employee_details_row.dart';
import 'package:assessment/views/widgets/field_and_text_row.dart';
import 'package:assessment/views/widgets/main_container.dart';
import 'package:assessment/views/widgets/tile_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DayClosingScreen extends StatefulWidget {
  DayClosingScreen({super.key});

  @override
  State<DayClosingScreen> createState() => _DayClosingScreenState();
}

class _DayClosingScreenState extends State<DayClosingScreen> {
  TextEditingController advanceController = TextEditingController(text: "0");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocalDataController>(context, listen: false).fetchSalesReport();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<LocalDataController>(context, listen: false);
    final String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
    List<SalesReportModel> salesReports = pro.getSalesReportsByDate(date);
    double totalSales = 0;
    double totalServices = 0;
    double totalCollection = 0;

    for (var report in salesReports) {
      totalSales += report.productTotal ?? 0;
      totalServices += report.serviceTotal ?? 0;
      totalCollection += report.totalAmount ?? 0;
    }

    double advance = double.tryParse(advanceController.text) ?? 0;
    double netCollection = totalCollection - advance;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.08),
          child: CustomAppBar(size: size, text: "Day Closing")),
      body: SingleChildScrollView(
          child: MainContainer(
        size: size,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TileHeading(text1: "Day Closing by", text2: "Staff"),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  const DayClosingDataHead(text: "Date:"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * 0.06,
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Date",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const EmployeeDetailsRow(
                      bordered: false,
                      empData: "Thomas naz weaver",
                      head: "Employee",
                    ),
                    EmployeeDetailsRow(
                      bordered: false,
                      empData: totalServices.toString(),
                      head: "Total Service",
                    ),
                    EmployeeDetailsRow(
                      bordered: false,
                      empData: totalSales.toString(),
                      head: "Total Sales",
                    ),
                    EmployeeDetailsRow(
                      bordered: false,
                      empData: totalCollection.toString(),
                      head: "Total Collection",
                    ),
                    EmployeeDetailsRow(
                      bordered: false,
                      empData: netCollection.toString(),
                      head: "Net Collection",
                    ),
                    FieldAndTextRow(
                      controller: advanceController,
                      label: "advance",
                      size: size,
                      text: "Advance",
                    )
                  ],
                ),
              ),
              CustomSubmitButton(
                size: size,
                onPressed: () {
                  addDayClosing(
                    context,
                    advance,
                    netCollection,
                    totalCollection,
                    totalSales,
                    totalServices,
                  );
                },
              )
            ],
          ),
        ),
      )),
    );
  }

  void addDayClosing(BuildContext context, advance, netCollection,
      totalCollection, totalSales, totalServices) {
    final pro = Provider.of<LocalDataController>(context, listen: false);
    final date = DateFormat("dd-MM-yyyy").format(DateTime.now());

    final DayClosingReportModel dayClosing = DayClosingReportModel(
        advance: advance,
        date: date,
        employeeId: "12",
        employeeName: "Thomas naz weaver",
        netCollection: netCollection,
        status: "Approved",
        totalCollection: totalCollection,
        totalSales: totalSales,
        totalServices: totalServices);
    pro.addDayClosing(dayClosing);
  }
}
