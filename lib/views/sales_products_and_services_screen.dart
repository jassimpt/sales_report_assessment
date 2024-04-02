import 'package:flutter/material.dart';
import 'package:assessment/views/widgets/day_closing_data_field.dart';
import 'package:assessment/views/widgets/day_closing_data_head.dart';
import 'package:assessment/views/widgets/employee_tile_head.dart';
import 'package:assessment/helpers/colors.dart';

class SalesProductsAndServicesScreen extends StatefulWidget {
  SalesProductsAndServicesScreen({Key? key}) : super(key: key);

  @override
  _SalesProductsAndServicesScreenState createState() =>
      _SalesProductsAndServicesScreenState();
}

class _SalesProductsAndServicesScreenState
    extends State<SalesProductsAndServicesScreen> {
  final TextEditingController dateController = TextEditingController();
  List<Widget> rows = [];

  final List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3'];
  final Map<String, double> itemAmounts = {
    'Item 1': 10.0,
    'Item 2': 20.0,
    'Item 3': 30.0,
  };

  String selectedItem = 'Item 1';
  double selectedAmount = 10.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: splashBackgroundColor,
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
              color: tileBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmployeeTileHeading(
                  size: size,
                  heading: "Sales by Staff-products&services",
                ),
                Row(
                  children: [
                    const DayClosingDataHead(text: "Date:"),
                    SizedBox(
                      width: size.width * 0.5,
                      height: size.height * 0.08,
                      child: DayClosingDataField(
                        fillColor: textFieldFill,
                        readOnly: true,
                        controller: dateController,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          width: size.width * 0.22,
                          height: size.height * 0.05,
                          decoration:
                              const BoxDecoration(color: splashBackgroundColor),
                          child: const Center(
                            child: Text(
                              "Particular",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          width: size.width * 0.22,
                          height: size.height * 0.05,
                          decoration:
                              const BoxDecoration(color: splashBackgroundColor),
                          child: const Center(
                            child: Text(
                              "Qty",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          width: size.width * 0.22,
                          height: size.height * 0.05,
                          decoration:
                              const BoxDecoration(color: splashBackgroundColor),
                          child: const Center(
                            child: Text(
                              "Amount",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          width: size.width * 0.22,
                          height: size.height * 0.05,
                          decoration:
                              const BoxDecoration(color: splashBackgroundColor),
                          child: const Center(
                            child: Text(
                              "Action",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...rows,
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rows.add(buildRow(size));
                    });
                  },
                  child: Text("Add item"),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(Size size) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: size.height * 0.06,
              child: DropdownButton<String>(
                value: selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedItem = newValue!;

                    selectedAmount = itemAmounts[selectedItem]!;
                  });
                },
                items:
                    dropdownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Container(
              height: size.height * 0.06,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: textFieldFill,
                  hintText: 'Qty',
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Container(
              height: size.height * 0.06,
              child: Text(selectedAmount.toString()), // Show selected amount
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  rows.removeLast();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
