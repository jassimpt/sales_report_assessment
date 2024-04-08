import 'package:assessment/helpers/colors.dart';
import 'package:assessment/model/data_model.dart';
import 'package:assessment/views/dashboard/widgets/custom_dashboard_tile.dart';
import 'package:assessment/views/widgets/main_container.dart';
import 'package:assessment/views/widgets/tile_heading.dart';
import 'package:flutter/material.dart';

class MonthlyTotalsWidget extends StatelessWidget {
  const MonthlyTotalsWidget(
      {super.key, required this.data, required this.size});

  final Size size;
  final DataModel data;
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      size: size,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 30),
        child: Column(
          children: [
            const TileHeading(text1: "Monthly", text2: "Totals"),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDashboardTile(
                  title1: "Total Services",
                  title2: "Total Sales",
                  value1: data.totalServiceAmount.toString(),
                  value2: data.totalSalesAmount.toString(),
                  color1: buttonColor1,
                  color2: Colors.blue.shade400,
                  size: size,
                  height1: size.height * 0.13,
                  width1: size.width * 0.4,
                  height2: size.height * 0.13,
                  width2: size.width * 0.4,
                ),
                CustomDashboardTile(
                  title1: "Total Advance",
                  title2: "Commision Recieved",
                  value1: data.advanceTaken.toString(),
                  value2: data.commissionEarned.toString(),
                  color1: Colors.amber.shade400,
                  color2: tileColor,
                  size: size,
                  height1: size.height * 0.13,
                  width1: size.width * 0.4,
                  height2: size.height * 0.13,
                  width2: size.width * 0.4,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
