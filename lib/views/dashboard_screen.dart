import 'package:assessment/controllers/data_provider.dart';
import 'package:assessment/model/data_model.dart';
import 'package:assessment/model/ten_days_transaction_model.dart';
import 'package:assessment/views/widgets/custom_dashboard_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Dashboard",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Consumer<DataProvider>(
          builder: (context, value, child) => FutureBuilder<DataModel>(
            future: value.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final DataModel data = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDashboardTile(
                          title1: "Total Sales Amt.",
                          title2: "Total Sales Amount",
                          value1: data.totalServiceAmount.toString(),
                          value2: data.totalSalesAmount.toString(),
                          size: size,
                          height1: size.height * 0.15,
                          width1: size.width * 0.45,
                          height2: size.height * 0.15,
                          width2: size.width * 0.45,
                        ),
                        CustomDashboardTile(
                          title1: "Commission Earned",
                          title2: "Advance Taken",
                          value1: data.commissionEarned.toString(),
                          value2: data.advanceTaken.toString(),
                          size: size,
                          height1: size.height * 0.13,
                          width1: size.width * 0.45,
                          height2: size.height * 0.13,
                          width2: size.width * 0.45,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.5), // shadow color
                              spreadRadius: 0.5, // spread radius
                              blurRadius: 2, // blur radius
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Last 10 days Statistics",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                axisLabelFormatter: (dynamic value) {
                                  if (value is AxisLabelRenderDetails) {
                                    final parsedDate =
                                        DateTime.tryParse(value.text);
                                    if (parsedDate != null) {
                                      final formattedDate = DateFormat("MM/dd")
                                          .format(parsedDate);
                                      return ChartAxisLabel(
                                          formattedDate, const TextStyle());
                                    }
                                  }
                                  // Return the original value as a label if it cannot be parsed or formatted
                                  return ChartAxisLabel(
                                      value.toString(), const TextStyle());
                                },
                              ),
                              series: <CartesianSeries>[
                                ColumnSeries<LastTenDaysTransactions, String>(
                                  dataSource: data.lastTenDaysTransactions!,
                                  xValueMapper:
                                      (LastTenDaysTransactions transaction,
                                              _) =>
                                          transaction.date!,
                                  yValueMapper:
                                      (LastTenDaysTransactions transaction,
                                              _) =>
                                          transaction.amount!.toDouble(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                print(snapshot.error);
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
