import 'package:assessment/controllers/data_provider.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/widgets/bottom_nav.dart';
import 'package:assessment/views/login/widgets/custom_button.dart';
import 'package:assessment/views/login/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back!',
                      style: GoogleFonts.urbanist(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text("Glad to see you,",
                        style: GoogleFonts.urbanist(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: specialHeadColor)),
                    Text("Again!",
                        style: GoogleFonts.urbanist(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: CustomTextfield(
                    filled: true,
                    obscureText: false,
                    hinttext: "Enter your email",
                    controller: emailController),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: CustomTextfield(
                    filled: true,
                    obscureText: true,
                    hinttext: "Enter password",
                    controller: passwordController),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password ?',
                      style: GoogleFonts.urbanist(
                          fontSize: 14, color: Colors.black.withOpacity(0.8)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    login(context);
                  }
                },
                size: size,
                buttonname: "Login",
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                      style: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {},
                    child: Text('Register Now',
                        style: GoogleFonts.urbanist(
                            fontSize: 14,
                            color: specialHeadColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    final pro = Provider.of<DataProvider>(context, listen: false);

    try {
      await pro.userLogin(
          username: emailController.text, password: passwordController.text);

      if (pro.status == "success") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLogged", true);
        prefs.setString("token", pro.token!);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to login. Please try again.")));
    }
  }
}
