import 'package:assessment/controllers/basic_controller.dart';
import 'package:assessment/controllers/data_controller.dart';
import 'package:assessment/model/sales_report_model.dart';
import 'package:assessment/views/sales_report_screen.dart';
import 'package:assessment/views/widgets/custom_app_bar.dart';
import 'package:assessment/views/widgets/custom_submit_button.dart';
import 'package:assessment/views/widgets/data_table.dart';
import 'package:assessment/views/widgets/employee_details_row.dart';
import 'package:assessment/views/widgets/field_and_text_row.dart';
import 'package:assessment/views/widgets/main_container.dart';
import 'package:assessment/views/widgets/product_dialogue_box.dart';
import 'package:assessment/views/widgets/tile_heading.dart';
import 'package:flutter/material.dart';
import 'package:assessment/views/widgets/day_closing_data_field.dart';
import 'package:assessment/views/widgets/day_closing_data_head.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SalesProductsAndServicesScreen extends StatelessWidget {
  SalesProductsAndServicesScreen({super.key});

  final TextEditingController dateController = TextEditingController();
  final TextEditingController qtyController = TextEditingController(text: "1");
  final TextEditingController amountController = TextEditingController();
  final TextEditingController itemTotalController = TextEditingController();
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: CustomAppBar(size: size, text: "Products & Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainContainer(
              size: size,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sales by ",
                        style: GoogleFonts.openSans(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Staff",
                        style: GoogleFonts.openSans(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const TileHeading(text1: "Products & ", text2: "Services"),
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Added Services",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Consumer<BasicController>(
                      builder: (context, pro, child) =>
                          DataTableWidget(productsList: pro.serviceList),
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
                      empData: totals["productTotal"].toString(),
                      head: "Item Total",
                    ),
                    EmployeeDetailsRow(
                      bordered: false,
                      empData: totals["subTotal"].toString(),
                      head: "Sub Total",
                    ),
                    EmployeeDetailsRow(
                      bordered: false,
                      empData: totals["serviceTotal"].toString(),
                      head: "Service Total",
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
                      child: CustomSubmitButton(
                          size: size,
                          onPressed: () {
                            addSalesReport(context);
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: SizedBox(
                        width: size.width,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SalesReportScreen(),
                                  ));
                            },
                            child: Text(
                              "Sales Report",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  void addSalesReport(BuildContext context) {
    final pro = Provider.of<LocalDataController>(context, listen: false);
    final pros = Provider.of<BasicController>(context, listen: false);
    final double discount = double.tryParse(discountController.text) ?? 0;
    Map<String, double> totals =
        pros.calculateTotals(pros.productsList, pros.serviceList, discount);
    final date = DateFormat("dd-MM-yyyy").format(DateTime.now());
    final SalesReportModel salesReport = SalesReportModel(
      date: date,
      discount: discount,
      employeeId: "12",
      employeeName: "Thomas Naz Weaver",
      paymentMethod: pros.selectedPaymentMethod,
      productTotal: totals["productTotal"],
      serviceTotal: totals["serviceTotal"],
      subTotal: totals["subTotal"],
      totalAmount: totals["totalAmount"],
    );
    pro.addSalesReport(salesReport);
    pro.salesReportList.length;
  }
}
