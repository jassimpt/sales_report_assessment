import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/widgets/custom_app_bar.dart';
import 'package:assessment/views/widgets/employee_details_row.dart';
import 'package:assessment/views/widgets/main_container.dart';
import 'package:assessment/views/widgets/tile_heading.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.08),
          child: CustomAppBar(size: size, text: "Profile"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade100),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                          color: splashBackgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black54,
                      tabs: const [
                        Tab(
                          text: "User Info",
                        ),
                        Tab(
                          text: "Company Info",
                        ),
                        Tab(
                          text: "Salary Info",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.7,
                child: TabBarView(
                  children: [
                    MainContainer(
                      size: size,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            // TileHeading(
                            //   text1: "Employee",
                            //   text2: "Details",
                            // ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "12",
                              head: "Employee ID",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "EMP1002",
                              head: "Employee Company ID",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "nazbeer",
                              head: "Username",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "Thomas Naz Weaver",
                              head: "Full Name",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "Afghan",
                              head: "Nationality",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "971524762486",
                              head: "Mobile No",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "W549459",
                              head: "Passport No",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "May 29, 2024",
                              head: "Passport Expiration Date",
                            ),
                          ],
                        ),
                      ),
                    ),
                    //asdasd
                    MainContainer(
                      size: size,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            // TileHeading(text1: "Employment", text2: "Details"),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "213123236778858",
                              head: "Emirates ID",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "May 30, 2024",
                              head: "ID Expiration Date",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "March 30, 2024",
                              head: "Joining Date",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "staff 2",
                              head: "Job Role",
                            ),
                          ],
                        ),
                      ),
                    ),
                    //dasdads
                    MainContainer(
                      size: size,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            // TileHeading(text1: "Salary", text2: "Details"),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "6899.00",
                              head: "Basic Pay",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "1000.00",
                              head: "House Allowance",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "0.00",
                              head: "Transportation Allowance",
                            ),
                            EmployeeDetailsRow(
                              bordered: true,
                              empData: "5.00",
                              head: "Commission Percentage",
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
