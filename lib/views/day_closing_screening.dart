import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/widgets/day_closing_data_field.dart';
import 'package:assessment/views/widgets/day_closing_data_head.dart';
import 'package:assessment/views/widgets/employee_tile_head.dart';
import 'package:flutter/material.dart';

class DayClosingScreen extends StatelessWidget {
  DayClosingScreen({super.key});

  TextEditingController dateController =
      TextEditingController(text: "02-04-2024");
  TextEditingController employeeController =
      TextEditingController(text: "Thomas Naz Weaver");
  TextEditingController totalServiceController =
      TextEditingController(text: "0");
  TextEditingController totalSalesController = TextEditingController(text: "0");
  TextEditingController totalCollectionController =
      TextEditingController(text: "0");
  TextEditingController advanceController = TextEditingController(text: "0");
  TextEditingController netCollectionController =
      TextEditingController(text: "0.00");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: splashBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Day Closing",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: tileBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmployeeTileHeading(
                    size: size, heading: "Day Closing by Employee"),
                const DayClosingDataHead(
                  text: "Date:",
                ),
                DayClosingDataField(
                  controller: dateController,
                  fillColor: textFieldFill,
                  readOnly: true,
                ),
                const DayClosingDataHead(
                  text: "Employee:",
                ),
                DayClosingDataField(
                  controller: employeeController,
                  fillColor: textFieldFill,
                  readOnly: true,
                ),
                const DayClosingDataHead(
                  text: "Total Service:",
                ),
                DayClosingDataField(
                  controller: totalServiceController,
                  fillColor: textFieldFill,
                  readOnly: true,
                ),
                const DayClosingDataHead(
                  text: "Total Sales:",
                ),
                DayClosingDataField(
                  controller: totalSalesController,
                  fillColor: textFieldFill,
                  readOnly: true,
                ),
                const DayClosingDataHead(
                  text: "Total Collection:",
                ),
                DayClosingDataField(
                  controller: totalCollectionController,
                  fillColor: textFieldFill,
                  readOnly: true,
                ),
                const DayClosingDataHead(
                  text: "Advance:",
                ),
                DayClosingDataField(
                  controller: advanceController,
                  fillColor: Colors.white,
                  readOnly: false,
                ),
                const DayClosingDataHead(
                  text: "Net Collection:",
                ),
                DayClosingDataField(
                  controller: netCollectionController,
                  fillColor: textFieldFill,
                  readOnly: true,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          backgroundColor:
                              MaterialStatePropertyAll(buttonColor1)),
                      onPressed: () {},
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
