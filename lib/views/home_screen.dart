import 'package:assessment/controllers/data_provider.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/dashboard_screen.dart';
import 'package:assessment/views/login_screen.dart';
import 'package:assessment/views/profile_screen.dart';
import 'package:assessment/views/widgets/custom_tile_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: splashBackgroundColor,
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          'Ez Shop',
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          IconButton(
            onPressed: () {
              logOut(context);
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          CustomTileRow(
            size: size,
            icon1: Icons.home,
            icon2: Icons.account_circle,
            text1: "Dashboard",
            text2: "Profile",
            onTap1: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashBoardScreen(),
                  ));
            },
            onTap2: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          CustomTileRow(
            size: size,
            icon1: Icons.calendar_month_outlined,
            icon2: Icons.add_shopping_cart_outlined,
            text1: "Day closing",
            text2: "Sales-products & services",
            onTap1: () {},
            onTap2: () {},
          ),
          CustomTileRow(
            size: size,
            icon1: Icons.add_shopping_cart_outlined,
            icon2: Icons.add_shopping_cart_outlined,
            text1: "Sales-items",
            text2: "Sales-products",
            onTap1: () {},
            onTap2: () {},
          ),
          CustomTileRow(
            size: size,
            icon1: Icons.report,
            icon2: Icons.account_balance,
            text1: "Sales report",
            text2: "Day closing report",
            onTap1: () {},
            onTap2: () {},
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
