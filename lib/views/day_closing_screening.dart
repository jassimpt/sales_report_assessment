import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/widgets/custom_app_bar.dart';
import 'package:assessment/views/widgets/day_closing_data_head.dart';
import 'package:assessment/views/widgets/employee_details_row.dart';
import 'package:assessment/views/widgets/main_container.dart';
import 'package:assessment/views/widgets/tile_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(size.height * 0.08), // Set your preferred height
          child: CustomAppBar(size: size, text: "Day Closing")),
      body: SingleChildScrollView(
          child: MainContainer(
        size: size,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TileHeading(text1: "Day Closing by", text2: "Staff"),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  const DayClosingDataHead(text: "Date:"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * 0.06,
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Date",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const EmployeeDetailsRow(
                      bordered: false,
                      empData: "Thomas naz weaver",
                      head: "Employee",
                    ),
                    const EmployeeDetailsRow(
                      bordered: false,
                      empData: "0",
                      head: "Total Service",
                    ),
                    const EmployeeDetailsRow(
                      bordered: false,
                      empData: "0",
                      head: "Total Sales",
                    ),
                    const EmployeeDetailsRow(
                      bordered: false,
                      empData: "0",
                      head: "Total Collection",
                    ),
                    const EmployeeDetailsRow(
                      bordered: false,
                      empData: "0",
                      head: "Net Collection",
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Row(
                        children: [
                          const DayClosingDataHead(text: "Advance:"),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: size.height * 0.06,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Advance",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                child: SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor:
                          const MaterialStatePropertyAll(buttonColor1),
                    ),
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
      )),
    );
  }
}
