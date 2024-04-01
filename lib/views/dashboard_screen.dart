import 'package:assessment/controllers/data_provider.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:assessment/model/data_model.dart';
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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: splashBackgroundColor,
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
      body: SingleChildScrollView(
        child: Padding(
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
                      MonthlyTotalsWidget(data: data),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
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
