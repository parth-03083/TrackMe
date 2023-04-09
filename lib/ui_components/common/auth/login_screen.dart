import 'package:ace_hack/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../../models/user.dart';
import '../../../routes.dart';
import '../../size_info.dart';

import 'package:http/http.dart' as http;
import '../constant.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final student;

  Future<void> getD() async {
    const url = "http://192.168.43.76:8000/students";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      student = studentFromJson(response.body.toString());
      // print(student[0].id);
    }
  }

  @override
  void initState() {
    getD();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getAllUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String emailCred = student[0].email.toString();
    String passCred = student[0].password.toString();
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    SizeInfo.init(context);
    return Scaffold(
        backgroundColor: scaffoldColor,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: secondaryColor.withOpacity(.6),
            ),
            margin: EdgeInsets.fromLTRB(0, SizeInfo.screenHeight * .2, 0, 0),
            height: SizeInfo.screenHeight * .6,
            width: SizeInfo.screenWidth * .8,
            child: Stack(
              children: [
                const Opacity(
                  opacity: .4,
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
                        "Login",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(flex: 1),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: email,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: primaryColor)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: pass,
                          cursorColor: scaffoldColor,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: primaryColor)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent.withOpacity(.5),
                          ),
                          onPressed: () {
                            if (emailCred.contains(email.text) &&
                                passCred.contains(pass.text)) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Routes(),
                                ),
                              );
                            }
                          },
                          child: Center(
                            child: Text(
                              "Log-In",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Forget Password",
                        style: TextStyle(color: primaryColor.withOpacity(.6)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have a account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const RegisterScreen()));
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}





// Center(
//         child: Text(student[0].id.toString()),
//       ),