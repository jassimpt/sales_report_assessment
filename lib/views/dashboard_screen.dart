import 'package:assessment/controllers/data_provider.dart';
import 'package:assessment/model/data_model.dart';
import 'package:assessment/views/widgets/custom_app_bar.dart';
import 'package:assessment/views/widgets/monthly_totals_widget.dart';
import 'package:assessment/views/widgets/statistics_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(size.height * 0.08), // Set your preferred height
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
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: StatisticsChart(data: data),
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
      ),
    );
  }
}
