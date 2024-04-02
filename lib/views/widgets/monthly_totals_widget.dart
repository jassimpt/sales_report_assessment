import 'package:assessment/helpers/colors.dart';
import 'package:assessment/model/data_model.dart';
import 'package:assessment/views/widgets/custom_dashboard_tile.dart';
import 'package:assessment/views/widgets/employee_tile_head.dart';
import 'package:flutter/material.dart';

class MonthlyTotalsWidget extends StatelessWidget {
  const MonthlyTotalsWidget({super.key, required this.data});

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: tileBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            EmployeeTileHeading(size: size, heading: "Monthly Totals"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDashboardTile(
                  title1: "Total Service Amt.",
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
                  width1: size.width * 0.43,
                  height2: size.height * 0.13,
                  width2: size.width * 0.41,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
