import 'package:assessment/helpers/colors.dart';
import 'package:assessment/views/login/widgets/custom_button.dart';
import 'package:assessment/views/login/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenSaloon extends StatelessWidget {
  LoginScreenSaloon({super.key});

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
              Stack(
                children: [
                  Container(
                    height: size.height / 2,
                    width: size.width,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30)),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/saloon_login_background2.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome !',
                          style: GoogleFonts.urbanist(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text("Please enter your data to",
                            style: GoogleFonts.urbanist(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        Text("continue",
                            style: GoogleFonts.urbanist(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: specialFontColor)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: CustomTextfield(
                    filled: false,
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
                    filled: false,
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
                height: size.height * 0.02,
              ),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // login function
                  }
                },
                size: size,
                buttonname: "Login",
              ),
              SizedBox(
                height: size.height * 0.03,
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
}
