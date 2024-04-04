import 'package:assessment/model/data_model.dart';
import 'package:assessment/model/ten_days_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsChart extends StatelessWidget {
  const StatisticsChart({super.key, required this.data});

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
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
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
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
