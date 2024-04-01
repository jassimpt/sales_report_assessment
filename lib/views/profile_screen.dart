import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/widgets/employee_details_row.dart';
import 'package:assessment/views/widgets/employee_tile_head.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: splashBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Profile",
          style: GoogleFonts.urbanist(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
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
                  children: [
                    EmployeeTileHeading(
                        size: size, heading: "Employee Details"),
                    const EmployeeDetailsRow(
                      empData: "12",
                      head: "Employee ID",
                    ),
                    const EmployeeDetailsRow(
                      empData: "EMP1002",
                      head: "Employee Company ID",
                    ),
                    const EmployeeDetailsRow(
                      empData: "nazbeer",
                      head: "Username",
                    ),
                    const EmployeeDetailsRow(
                      empData: "Thomas Naz Weaver",
                      head: "Full Name",
                    ),
                    const EmployeeDetailsRow(
                      empData: "Afghan",
                      head: "Nationality",
                    ),
                    const EmployeeDetailsRow(
                      empData: "971524762486",
                      head: "Mobile No",
                    ),
                    const EmployeeDetailsRow(
                      empData: "W549459",
                      head: "Passport No",
                    ),
                    const EmployeeDetailsRow(
                      empData: "May 29, 2024",
                      head: "Passport Expiration Date",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
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
                  children: [
                    EmployeeTileHeading(
                      size: size,
                      heading: "Employment Details",
                    ),
                    const EmployeeDetailsRow(
                      empData: "213123236778858",
                      head: "Emirates ID",
                    ),
                    const EmployeeDetailsRow(
                      empData: "May 30, 2024",
                      head: "ID Expiration Date",
                    ),
                    const EmployeeDetailsRow(
                      empData: "6899.00",
                      head: "Basic Pay",
                    ),
                    const EmployeeDetailsRow(
                      empData: "1000.00",
                      head: "House Allowance",
                    ),
                    const EmployeeDetailsRow(
                      empData: "0.00",
                      head: "Transportation Allowance",
                    ),
                    const EmployeeDetailsRow(
                      empData: "5.00",
                      head: "Commission Percentage",
                    ),
                    const EmployeeDetailsRow(
                      empData: "March 30, 2024",
                      head: "Joining Date",
                    ),
                    const EmployeeDetailsRow(
                      empData: "staff 2",
                      head: "Job Role",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
