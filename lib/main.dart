import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ace_hack/provider/user_provider.dart';

import 'ui_components/common/auth/login_screen.dart';
import 'ui_components/common/constant.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
  //   (value) {
  //     Map response = _initializeConnection();
  //     userDetails = response;
  //     print(response);
  runApp(MyApp());
  // },
  // );
}

class MyApp extends StatefulWidget {
  // dynamic response;
  MyApp({
    Key? key,
    // required this.response,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Map data = {};
  // @override
  // void initState() {
  //   _initializeConnection();
  //   super.initState();
  // }

  // Future<void> _initializeConnection() async {
  //   final response = await http.get(Uri.parse('$url/students'));
  //   final List<dynamic> responseData = json.decode(response.body);
  //   final List<User> posts =
  //       responseData.map((dynamic json) => User.fromJson(json)).toList();

  //   List id = [],
  //       college = [],
  //       fName = [],
  //       sName = [],
  //       email = [],
  //       pass = [],
  //       profilePic = [],
  //       aadhaarNo = [],
  //       mobileNo = [];
  //   for (var post in posts) {
  //     id.add(post.id);
  //     college.add(post.college);
  //     fName.add(post.fName);
  //     sName.add(post.sName);
  //     email.add(post.email);
  //     pass.add(post.password);
  //     profilePic.add(post.profilePic);
  //     aadhaarNo.add(post.aadhaarNo);
  //     mobileNo.add(post.mobileNo);
  //     Map tempdata = {
  //       "id": id,
  //       "college": college,
  //       "fName": fName,
  //       "sName": sName,
  //       "email": email,
  //       "pass": pass,
  //       "profilePic": profilePic,
  //       "aadhaarNo": aadhaarNo,
  //       "mobileNo": mobileNo
  //     };
  //     setState(() {
  //       data = tempdata;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'HTL',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Alkatra",
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: secondaryColor),
            backgroundColor: primaryColor,
            centerTitle: true,
            elevation: 1,
            titleTextStyle: TextStyle(
                fontFamily: "Alkatra",
                color: secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
