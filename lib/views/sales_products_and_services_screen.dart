import 'package:assessment/controllers/basic_controller.dart';
import 'package:assessment/views/widgets/custom_submit_button.dart';
import 'package:assessment/views/widgets/product_dialogue_box.dart';
import 'package:assessment/views/widgets/table_heading.dart';
import 'package:flutter/material.dart';
import 'package:assessment/views/widgets/day_closing_data_field.dart';
import 'package:assessment/views/widgets/day_closing_data_head.dart';
import 'package:assessment/views/widgets/employee_tile_head.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:provider/provider.dart';

class SalesProductsAndServicesScreen extends StatelessWidget {
  SalesProductsAndServicesScreen({super.key});

  final TextEditingController dateController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController itemTotalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: splashBackgroundColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return ProductDialogueBox(
                amountController: amountController,
                qtyController: qtyController,
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Select Items",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      TableHeading(
                        size: size,
                        text: "Particular",
                      ),
                      TableHeading(
                        size: size,
                        text: "Qty",
                      ),
                      TableHeading(
                        size: size,
                        text: "Amount",
                      ),
                      TableHeading(
                        size: size,
                        text: "Action",
                      ),
                    ],
                  ),
                ),
                Consumer<BasicController>(
                  builder: (context, value, child) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.productsList.length,
                    itemBuilder: (context, index) {
                      final productHistory = value.productsList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                productHistory.particular!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                productHistory.qty.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                productHistory.amount.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Select Services",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      TableHeading(
                        size: size,
                        text: "Particular",
                      ),
                      TableHeading(
                        size: size,
                        text: "Qty",
                      ),
                      TableHeading(
                        size: size,
                        text: "Amount",
                      ),
                      TableHeading(
                        size: size,
                        text: "Action",
                      ),
                    ],
                  ),
                ),
                Consumer<BasicController>(
                  builder: (context, value, child) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.serviceList.length,
                    itemBuilder: (context, index) {
                      final productHistory = value.serviceList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                productHistory.particular!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                productHistory.qty.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                productHistory.amount.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                DayClosingDataHead(text: "Item total:"),
                DayClosingDataField(
                    fillColor: textFieldFill,
                    readOnly: true,
                    controller: itemTotalController),
                DayClosingDataHead(text: "Service total:"),
                DayClosingDataField(
                    fillColor: textFieldFill,
                    readOnly: true,
                    controller: itemTotalController),
                DayClosingDataHead(text: "Total Amount:"),
                DayClosingDataField(
                    fillColor: textFieldFill,
                    readOnly: true,
                    controller: itemTotalController),
                DayClosingDataHead(text: "Sub total:"),
                DayClosingDataField(
                    fillColor: textFieldFill,
                    readOnly: true,
                    controller: itemTotalController),
                DayClosingDataHead(text: "Discount total:"),
                DayClosingDataField(
                    fillColor: textFieldFill,
                    readOnly: true,
                    controller: itemTotalController),
                DayClosingDataHead(text: "Payment Method:"),
                DayClosingDataField(
                    fillColor: textFieldFill,
                    readOnly: true,
                    controller: itemTotalController),
                CustomSubmitButton(
                  name: "Submit",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
