import 'package:assessment/controllers/data_provider.dart';
import 'package:assessment/views/login/login_screen.dart';
import 'package:assessment/views/sales/sales_products.dart';
import 'package:assessment/views/sales/sales_report_screen.dart';
import 'package:assessment/views/sales/sales_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.size, required this.text});

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.065,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.8,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          child: Text("Sales by Products"),
                          value: "sales by products",
                        ),
                        const PopupMenuItem(
                          child: Text("Sales by Services"),
                          value: "sales by services",
                        ),
                        const PopupMenuItem(
                          child: Text("Sales Report"),
                          value: "sales report",
                        ),
                        const PopupMenuItem(
                          child: Text("Logout"),
                          value: 'logout',
                        ),
                      ],
                      onSelected: (value) {
                        if (value == "logout") {
                          logOut(context);
                        } else if (value == "sales report") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SalesReportScreen(),
                              ));
                        } else if (value == "sales by products") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SalesProductsScreen(),
                              ));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SalesServiceScreen(),
                              ));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void logOut(BuildContext context) {
    final pro = Provider.of<DataProvider>(context, listen: false);
    pro.logout();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }
}
