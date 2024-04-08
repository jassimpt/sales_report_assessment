import 'package:assessment/controllers/data_controller.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assessment/views/widgets/main_container.dart';

class SalesReportScreen extends StatefulWidget {
  const SalesReportScreen({super.key});

  @override
  State<SalesReportScreen> createState() => _SalesReportScreenState();
}

class _SalesReportScreenState extends State<SalesReportScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<LocalDataController>(context, listen: false).fetchSalesReport();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sales Report",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: MainContainer(
          size: size,
          child: Consumer<LocalDataController>(
            builder: (context, local, child) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  border: TableBorder.all(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.5)),
                  headingTextStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  headingRowColor:
                      const MaterialStatePropertyAll(splashBackgroundColor),
                  dividerThickness: 1.0,
                  columnSpacing: size.width * 0.05,
                  columns: const [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Employee ID')),
                    DataColumn(label: Text('Product Total')),
                    DataColumn(label: Text('Service Total')),
                    DataColumn(label: Text('Sub Total')),
                    DataColumn(label: Text('Discount')),
                    DataColumn(label: Text('Total Amount')),
                    DataColumn(label: Text('Payment Method')),
                  ],
                  rows: local.salesReportList.map((report) {
                    return DataRow(
                      cells: [
                        DataCell(Text(report.date!)),
                        DataCell(Text(report.employeeId!)),
                        DataCell(Text(report.productTotal.toString())),
                        DataCell(Text(report.serviceTotal.toString())),
                        DataCell(Text(report.subTotal.toString())),
                        DataCell(Text(report.discount.toString())),
                        DataCell(Text(report.totalAmount.toString())),
                        DataCell(Text(report.paymentMethod!)),
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ));
  }
}
