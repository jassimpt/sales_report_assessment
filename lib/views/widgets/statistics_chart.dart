import 'package:assessment/model/data_model.dart';
import 'package:assessment/model/ten_days_transaction_model.dart';
import 'package:assessment/views/widgets/main_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsChart extends StatelessWidget {
  const StatisticsChart({super.key, required this.data});

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MainContainer(
      size: size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Last 10 days ",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Statistics",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(
              axisLabelFormatter: (dynamic value) {
                if (value is AxisLabelRenderDetails) {
                  final parsedDate = DateTime.tryParse(value.text);
                  if (parsedDate != null) {
                    final formattedDate =
                        DateFormat("MM/dd").format(parsedDate);
                    return ChartAxisLabel(formattedDate, const TextStyle());
                  }
                }

                return ChartAxisLabel(value.toString(), const TextStyle());
              },
            ),
            series: <CartesianSeries>[
              ColumnSeries<LastTenDaysTransactions, String>(
                dataSource: data.lastTenDaysTransactions!,
                xValueMapper: (LastTenDaysTransactions transaction, _) =>
                    transaction.date!,
                yValueMapper: (LastTenDaysTransactions transaction, _) =>
                    transaction.amount!.toDouble(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
