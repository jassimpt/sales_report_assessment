import 'package:assessment/controllers/data_controller.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/widgets/custom_app_bar.dart';
import 'package:assessment/views/widgets/main_container.dart';
import 'package:assessment/views/widgets/tile_heading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayClosingReportScren extends StatefulWidget {
  const DayClosingReportScren({Key? key});

  @override
  State<DayClosingReportScren> createState() => _DayClosingReportScrenState();
}

class _DayClosingReportScrenState extends State<DayClosingReportScren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocalDataController>(context, listen: false).fetchDayClosing();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: CustomAppBar(
          size: size,
          text: "Day Closing Report",
        ),
      ),
      body: MainContainer(
        size: size,
        child: Consumer<LocalDataController>(
          builder: (context, local, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                border: TableBorder.all(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.5)),
                headingTextStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                headingRowColor:
                    const MaterialStatePropertyAll(splashBackgroundColor),
                dividerThickness: 2,
                columnSpacing: size.width * 0.05,
                columns: const [
                  DataColumn(
                    label: Text('Date'),
                  ),
                  DataColumn(label: Text('Employee ID')),
                  DataColumn(label: Text('Total Services')),
                  DataColumn(label: Text('Total Sales')),
                  DataColumn(label: Text('Total Collection')),
                  DataColumn(label: Text('Advance')),
                  DataColumn(label: Text('Net Collection')),
                  DataColumn(label: Text('Status')),
                ],
                rows: local.dayClosingReportList.map((report) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(report.date!),
                      ),
                      DataCell(Text(report.employeeId!)),
                      DataCell(Text(report.totalServices.toString())),
                      DataCell(Text(report.totalSales.toString())),
                      DataCell(Text(report.totalCollection.toString())),
                      DataCell(Text(report.advance.toString())),
                      DataCell(Text(report.netCollection.toString())),
                      DataCell(
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              report.status!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
