import 'package:assessment/controllers/basic_controller.dart';
import 'package:assessment/controllers/data_controller.dart';
import 'package:assessment/controllers/data_provider.dart';
import 'package:assessment/model/day_closing_report_model.dart';
import 'package:assessment/model/sales_report_model.dart';
import 'package:assessment/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DayClosingReportModelAdapter().typeId) &&
      !Hive.isAdapterRegistered(SalesReportModelAdapter().typeId)) {
    Hive.registerAdapter(DayClosingReportModelAdapter());
    Hive.registerAdapter(SalesReportModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BasicController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalDataController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
