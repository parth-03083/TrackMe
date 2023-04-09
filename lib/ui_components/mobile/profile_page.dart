import 'package:ace_hack/ui_components/common/auth/login_screen.dart';
import 'package:flutter/material.dart';
import '../common/constant.dart';
import '../common/pie_chart.dart';
import '../size_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: secondaryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // shrinkWrap: true,
        children: [
          SizedBox(
            height: SizeInfo.screenHeight * .4,
            // width: SizeInfo.screenWidth * .4,
            child: const BuildChart(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Divider(color: primaryColor, thickness: 0.5),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Applied Jobs",
              style: TextStyle(fontSize: 18),
            ),
          ),
          buildCard("Flutter"),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Divider(color: primaryColor, thickness: 0.5),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Events",
              style: TextStyle(fontSize: 18),
            ),
          ),
          buildCard("Lorem Ipsum"),
          const Spacer(flex: 1),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: const Text("Log-Out"),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}

Widget buildCard(String title) {
  return Container(
      alignment: Alignment.center,
      height: 50,
      // width: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Card(
            color: secondaryColor.withOpacity(.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: primaryColor, fontSize: 15),
                ),
              ),
            ),
          );
        },
      ));
}
