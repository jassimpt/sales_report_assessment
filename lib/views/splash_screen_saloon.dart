import 'package:flutter/material.dart';

class SplashScreenSaloon extends StatelessWidget {
  const SplashScreenSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/saloon_login_background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Image.asset(
            "assets/images/mite_color_logo.png",
            height: size.height * 0.15,
          ),
        ),
      ),
    );
  }
}
