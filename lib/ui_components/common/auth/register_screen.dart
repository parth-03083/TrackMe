import 'package:ace_hack/ui_components/common/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../size_info.dart';
import '../constant.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: secondaryColor.withOpacity(.6),
          ),
          margin: EdgeInsets.fromLTRB(0, SizeInfo.screenHeight * .2, 0, 0),
          height: SizeInfo.screenHeight * .7,
          width: SizeInfo.screenWidth * .8,
          child: Stack(
            children: [
              const Positioned.fill(
                child: RiveAnimation.asset(
                  "assets/Robo.riv",
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Register",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(flex: 1),
                    buildTextField("First Name"),
                    const SizedBox(height: 10),
                    buildTextField("Last Name"),
                    const SizedBox(height: 10),
                    buildTextField("Email "),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        // controller: pass,
                        cursorColor: scaffoldColor,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: primaryColor)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildTextField("Confirm Password"),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent.withOpacity(.5),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(color: primaryColor, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

Widget buildTextField(String title) {
  return Container(
    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
    padding: const EdgeInsets.only(left: 15, right: 15),
    decoration: BoxDecoration(
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      // controller: email,
      cursorColor: primaryColor,
      decoration: InputDecoration(
          hintText: title, hintStyle: TextStyle(color: primaryColor)),
    ),
  );
}
