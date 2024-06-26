import 'package:assessment/controllers/data_provider.dart';
import 'package:assessment/model/data_model.dart';
import 'package:assessment/views/widgets/custom_app_bar.dart';
import 'package:assessment/views/dashboard/widgets/monthly_totals_widget.dart';
import 'package:assessment/views/dashboard/widgets/statistics_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: CustomAppBar(
          size: size,
          text: "Dashboard",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
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
                      MonthlyTotalsWidget(
                        data: data,
                        size: size,
                      ),
                      StatisticsChart(data: data),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
