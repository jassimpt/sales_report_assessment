import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/dashboard_screen.dart';
import 'package:assessment/views/day_closing_report_screen.dart';
import 'package:assessment/views/day_closing_screening.dart';
import 'package:assessment/views/profile_screen.dart';
import 'package:assessment/views/sales_products_and_services_screen.dart';
import 'package:assessment/views/sales_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedindex = 0;
  void pageChanger(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  List pages = [
    DashBoardScreen(),
    ProfileScreen(),
    DayClosingScreen(),
    SalesProductsAndServicesScreen(),
    DayClosingReportScren(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 227, 231, 241),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GNav(
              backgroundColor: Color.fromARGB(255, 227, 231, 241),
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: splashBackgroundColor,
              gap: 5,
              haptic: true,
              padding: EdgeInsets.all(15),
              selectedIndex: selectedindex,
              onTabChange: (value) => pageChanger(value),
              tabs: const [
                GButton(
                  icon: Iconsax.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Iconsax.user,
                  text: "Profile",
                ),
                GButton(
                  icon: Iconsax.calendar,
                  text: "Closing",
                ),
                GButton(
                  icon: Iconsax.shop,
                  text: "Sales",
                ),
                GButton(
                  icon: Iconsax.receipt_discount,
                  text: "Report",
                ),
              ],
            ),
          ),
        ),
      ),
      body: pages[selectedindex],
    );
  }
}
