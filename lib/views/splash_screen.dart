import 'dart:async';
import 'package:assessment/controllers/data_provider.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/home_screen.dart';
import 'package:assessment/views/login_screen.dart';
import 'package:assessment/views/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 3), () {
      checkLogin();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: splashBackgroundColor,
      body: Center(
        child: Image.asset(
          "assets/images/mite_solutions_white.png",
          height: size.height * 0.15,
        ),
      ),
    );
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final pro = Provider.of<DataProvider>(context, listen: false);
    bool isLogged = prefs.getBool("isLogged") ?? false;
    if (isLogged) {
      pro.token = prefs.getString("token");
      print(pro.token);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
  }
}
