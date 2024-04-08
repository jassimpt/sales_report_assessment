import 'package:assessment/controllers/basic_controller.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/widgets/custom_submit_button.dart';
import 'package:assessment/views/sales/widgets/data_table.dart';
import 'package:assessment/views/widgets/day_closing_data_field.dart';
import 'package:assessment/views/widgets/day_closing_data_head.dart';
import 'package:assessment/views/widgets/employee_details_row.dart';
import 'package:assessment/views/widgets/field_and_text_row.dart';
import 'package:assessment/views/widgets/main_container.dart';
import 'package:assessment/views/sales/widgets/product_add_dialoguebox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalesProductsScreen extends StatelessWidget {
  SalesProductsScreen({super.key});

  final TextEditingController amountController = TextEditingController();
  final TextEditingController qtyController = TextEditingController(text: "1");
  final TextEditingController dateController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

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
              return ProductAddDialogueBox(
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
        title: Text(
          "Sales by Staff - Products",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainContainer(
              size: size,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: size.height * 0.02,
                  // ),
                  // Center(
                  //   child: Text(
                  //     "Sales by Staff",
                  //     style: GoogleFonts.openSans(
                  //         fontSize: 20, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // Center(
                  //   child: Text(
                  //     "Products",
                  //     style: GoogleFonts.openSans(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.blue),
                  //   ),
                  // ),
                  Row(
                    children: [
                      const DayClosingDataHead(text: "Date:"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: SizedBox(
                          width: size.width * 0.65,
                          height: size.height * 0.07,
                          child: DayClosingDataField(
                            fillColor: textFieldFill,
                            readOnly: true,
                            controller: dateController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Added Items",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Consumer<BasicController>(
                      builder: (context, pro, child) => DataTableWidget(
                        productsList: pro.productsList,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MainContainer(
              size: size,
              child:
                  Consumer<BasicController>(builder: (context, basic, child) {
                double discount = double.tryParse(discountController.text) ?? 0;
                Map<String, double> totals = basic.calculateTotals(
                    basic.productsList, basic.serviceList, discount);

                return Column(
                  children: [
                    EmployeeDetailsRow(
                      bordered: false,
                      empData: totals["subTotal"].toString(),
                      head: "Sub Total",
                    ),
                    FieldAndTextRow(
                      controller: discountController,
                      size: size,
                      text: "Discount",
                      label: "discount",
                    ),
                    EmployeeDetailsRow(
                      bordered: false,
                      empData: totals["totalAmount"].toString(),
                      head: "Total Amount",
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Payment Method:",
                            style: TextStyle(
                                color: basicFontColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Consumer<BasicController>(
                            builder: (context, pro, child) {
                              return DropdownButton<String>(
                                value: pro.selectedPaymentMethod,
                                items: <String>[
                                  "Select any mode",
                                  "cash",
                                  "card"
                                ].map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  pro.paymentModeChanger(value!);
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomSubmitButton(size: size, onPressed: () {}),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
